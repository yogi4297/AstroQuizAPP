//
//  ConstilationVC.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/21/23.
//

import UIKit

class ConstilationVC: UIViewController {
    
    var constilationName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        ConstilationIV.image = UIImage(named: constilationName)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))

               
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
   
    @IBOutlet weak var ConstilationIV: UIImageView!
    
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            // Get the tap location in the view
            let tapLocation = gestureRecognizer.location(in: self.view)
            
        //print(tapLocation)
        
        let frame = self.view.frame.size
        
        print((tapLocation.x/frame.width*100))
        print((tapLocation.y/frame.height*100))
        
        //print(frame)
        
        let h = self.view.frame.height
        let w = self.view.frame.width
        
        let x = tapLocation.x/frame.width*100
        let y = tapLocation.y/frame.height*100
        
         var i = 1
        
        while(i<=tapMinMax[constilationName]!.count){
            if (Double(x)>=tapMinMax[constilationName]![i]!["xmin"]!) && (Double(x)<=tapMinMax[constilationName]![i]!["xmax"]!) && (Double(y)>=tapMinMax[constilationName]![i]!["ymin"]!) && (Double(y)<=tapMinMax[constilationName]![i]!["ymax"]!){
                
                print(i)
                
            }
            i+=1
        }
        
        
        
        

        //performSegue(withIdentifier: "movetoquiz", sender: gestureRecognizer)
        
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let const = segue.destination as! QuizVC
        
        const.constilationName = constilationName
    }

}
