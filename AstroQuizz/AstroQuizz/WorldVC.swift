//
//  ViewController.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/13/23.
//

import UIKit
import CoreData

class WorldVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var worldInfoTV: UITableView!{
        didSet{
            worldInfoTV.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    
    
    var responses:[UserResponse]=[]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        worldInfoTV.reloadData()
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
        
        
        
        do {
            
            if let points = try UserStars.fetchStar(forWorld: worldList[indexPath.row].worldName, in: AppDelegate.viewContext){
                
                cell.starLBL.text = points
            }
            
             } catch {
                 print("Error while fetching stars :\(error)")
             }
        
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

//    func loadPreDefined(){
//        
//        for world in worldList{
//            
//            for star in tapMinMax[world.worldName]!{
//                var i = 1
//                while(i<star.value.1){
//                    
//                    
//                    
//                    do {
//                        try UserResponse.create(world.worldName, star: Int32(star.key), question: Int32(randomInRange(lowerBound: 0, upperBound: questionList[world.worldName]!.count)),  response: -1, in: AppDelegate.viewContext)
//                         } catch {
//                             print("Error while inserting data: \(error)")
//                         }
//                     }
//                }
//            }
//            
//            }
//    func randomInRange(lowerBound: Int, upperBound: Int) -> Int {
//        // Ensure the lower and upper bounds are valid
//        assert(lowerBound < upperBound, "Lower bound must be less than upper bound")
//
//        // Calculate the range size
//        let rangeSize = UInt32(upperBound - lowerBound + 1)
//
//        // Generate a random number within the adjusted range
//        let randomValue = arc4random_uniform(rangeSize)
//
//        // Add the lower bound to the generated random value
//        let result = Int(randomValue) + lowerBound
//
//        return result
//    }
            
  


    @IBAction func onReset(_ sender: UIBarButtonItem) {
        
        
        do {
            try UserResponse.truncateData(in: AppDelegate.viewContext)
            try UserStars.truncateData(in: AppDelegate.viewContext)
            try StarChecks.truncateData(in: AppDelegate.viewContext)
            
        }
        catch{
            print("Error while truncting data in entites")
        }
        worldInfoTV.reloadData()
        
    }
    
    
        
  

}

