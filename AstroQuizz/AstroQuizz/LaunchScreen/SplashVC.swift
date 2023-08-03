//
//  ViewController.swift
//  AstroQuizz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/26/23.
//

import UIKit
import Lottie


class SplashVC: UIViewController {
    private var animationView: LottieAnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animationView = .init(name: "launchScreenAnimation")
          
          animationView!.frame = view.bounds
          
          // 3. Set animation content mode
          
          animationView!.contentMode = .scaleAspectFit
          
          animationView!.loopMode = .loop
          animationView!.animationSpeed = 0.5
          view.addSubview(animationView!)
          animationView!.play()
    }
    
    @IBOutlet weak var AimationView: LottieAnimationView!
    
    
    
}
