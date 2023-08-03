//
//  QuizVC.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/21/23.
//

import UIKit

class QuizVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var constilationName:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizTV.dataSource = self
        quizTV.delegate = self
        
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var quizTV: UITableView!{
        didSet{
            quizTV.layer.backgroundColor = UIColor.clear.cgColor
            quizTV.layer.cornerRadius = 20
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionList[constilationName!]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizcell", for: indexPath) as! QuizcellTVC
        
        cell.questionTV.text = questionList[constilationName!]![indexPath.row].question
        cell.world=constilationName!
        cell.questionNum=indexPath.row
        cell.answer=questionList[constilationName!]![indexPath.row].answer
        
        for option in cell.optionLBL{
            
            switch option.tag{
            case 0:
                option.text = "  "+questionList[constilationName!]![indexPath.row].options[option.tag]+"  "
                option.sizeToFit()
            case 1:
                option.text = "  "+questionList[constilationName!]![indexPath.row].options[option.tag]+"  "
            case 2:
                option.text = "  "+questionList[constilationName!]![indexPath.row].options[option.tag]+"  "
                option.sizeToFit()
            case 3:
                option.text = "  "+questionList[constilationName!]![indexPath.row].options[option.tag]+"  "
                option.sizeToFit()
            default:
                break
            }
            
        }
        cell.questionTV.sizeToFit()
        cell.questionTV.isScrollEnabled = false
        return cell
    }
    

}
