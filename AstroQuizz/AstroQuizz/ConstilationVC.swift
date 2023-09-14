//
//  ConstilationVC.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/21/23.
//

import UIKit
import Lottie
class ConstilationVC: UIViewController {
    
    var constilationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConstilationIV.image = UIImage(named: constilationName)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    @IBOutlet weak var ConstilationIV: UIImageView!
    
    var starno=0
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Get the tap location in the view
        let tapLocation = gestureRecognizer.location(in: self.view)
        
        //print(tapLocation)
        
        let frame = self.view.frame.size
        
        print((tapLocation.x/frame.width*100))
        print((tapLocation.y/frame.height*100))
        
        //print(frame)
        
//        let h = self.view.frame.height
//        let w = self.view.frame.width
        
        let x = tapLocation.x/frame.width*100
        let y = tapLocation.y/frame.height*100
        
        var i = 1
        
       
        

        while(i<=tapMinMax[constilationName]!.count){
            if (Double(x)>=tapMinMax[constilationName]![i]!.0["xmin"]!) && (Double(x)<=tapMinMax[constilationName]![i]!.0["xmax"]!) && (Double(y)>=tapMinMax[constilationName]![i]!.0["ymin"]!) && (Double(y)<=tapMinMax[constilationName]![i]!.0["ymax"]!){

                starno=i
                performSegue(withIdentifier: "movetoquiz", sender: gestureRecognizer)

            }
            i+=1
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let const = segue.destination as! QuizVC
        print(starno)
        const.constilationName = constilationName
        const.star=starno
        
    }
    
    
    
    
}
