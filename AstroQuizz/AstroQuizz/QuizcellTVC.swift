//
//  QuizcellTVC.swift
//  AstroQuizz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/25/23.
//

import UIKit

class QuizcellTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.backgroundColor = UIColor.clear.cgColor
        self.contentView.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var world:String?
    
    var questionNum:Int?
    
    var answer:Int?
    
    
    
    @IBOutlet weak var questionTV: UITextView!
   
    var optionSelect:UITapGestureRecognizer?
    
    @IBOutlet var optionLBL: [UILabel]!{
        didSet{
            for label in optionLBL{
                optionSelect = UITapGestureRecognizer(target: self, action: #selector(verifyChoice(_:)))
                label.layer.backgroundColor = UIColor.systemMint.cgColor
                label.layer.cornerRadius = 5
                let tagValue = Int(label.tag)
                
                
                label.addGestureRecognizer(optionSelect!)
                label.layer.setValue(tagValue, forKey: "tag")
                
            }
        }
    }
    
    @objc func verifyChoice(_ sender: UITapGestureRecognizer){
        let tag = sender.view?.layer.value(forKey: "tag")
        print(tag!)
        
            if tag as! Int == answer!{
                  optionLBL[tag as! Int ].layer.backgroundColor = UIColor.green.cgColor
                  
                  for label in optionLBL{
                      if label.tag != tag as! Int{
                          label.layer.backgroundColor = UIColor.systemMint.cgColor
                      }
                  }
              }else{
                  optionLBL[tag as! Int ].layer.backgroundColor = UIColor.red.cgColor
                  for label in optionLBL{
                      if label.tag != tag as! Int{
                          label.layer.backgroundColor = UIColor.systemMint.cgColor
                      }
                  }
               }
    }
    
    
    @IBOutlet weak var cv: UIView!{
        didSet{
            cv.layer.cornerRadius = 20
        }
    }
    
    
}
