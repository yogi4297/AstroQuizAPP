//
//  ViewController.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/13/23.
//

import UIKit

class WorldVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var worldInfoTV: UITableView!{
        didSet{
            worldInfoTV.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                worldInfoTV.delegate=self
                worldInfoTV.dataSource=self
                worldInfoTV.separatorStyle = .none
        
                
            
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        worldList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "world", for: indexPath) as! worldInfoCellVC
        cell.layer.opacity = 0
        
        cell.worlLBL.text=worldList[indexPath.row].worldName
        cell.worldIV.image = UIImage(named: worldList[indexPath.row].worldName)
        
        cell.worldDescTV.text = worldList[indexPath.row].wordDesc
        
        cell.starLBL.text = worldList[indexPath.row].points
        
        
        return cell
    }
    var value=""
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        value = worldList[indexPath.row].worldName
        
        performSegue(withIdentifier: "movetoconst", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let const = segue.destination as! ConstilationVC
        
        const.constilationName = value
        
    }

   
    

}

