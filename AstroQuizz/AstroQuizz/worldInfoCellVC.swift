//
//  worldInfoCellVC.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/20/23.
//

import UIKit

class worldInfoCellVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        self.layer.backgroundColor = UIColor.clear.cgColor

        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.2
        
        worldIV.layer.cornerRadius  = 20
        
        worldDescTV.isEditable = false
        worldDescTV.layer.backgroundColor = UIColor.black.cgColor
        
        worldDescTV.layer.cornerRadius = 20

        
        
    }
    
    
    @IBOutlet weak var cv: UIView!{
        didSet{
            cv.layer.cornerRadius = 20
        cv.layer.backgroundColor=UIColor.clear.cgColor
        }
    }
    
    @IBOutlet weak var worlLBL: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    
    @IBOutlet weak var worldIV: UIImageView!
    
    
    @IBOutlet weak var worldDescTV: UITextView!
        
    
    @IBOutlet weak var starLBL: UILabel!
    
    
    
    
}
