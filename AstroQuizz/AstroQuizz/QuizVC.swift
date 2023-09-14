//
//  QuizVC.swift
//  AstroQuiz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 7/21/23.
//

import UIKit
import Lottie

class QuizVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var constilationName:String?
    var star:Int?
    var response:UserResponse?
    
    var list: [question]=[]
    
    var resp:[UserResponse]?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
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
        print("asd")
        
       return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizcell", for: indexPath) as! QuizcellTVC
        
        if list.count != 0{
            print("index")
            print(indexPath.row)
            print(list[indexPath.row].question)
            cell.questionTV.text = list[indexPath.row].question
            cell.world=constilationName!
            cell.questionNum=indexPath.row
            cell.answer=list[indexPath.row].answer
            cell.starno=star
            
            
            do {
                response = try UserResponse.fetchResponse(for: constilationName!, star: Int32(star!), question: Int32(indexPath.row), in: AppDelegate.viewContext)
                //print(response!.userAnswer)
                
            } catch {
                print("Error while fetching the data \(error)")
            }
            
           
            
            if let resp = response{
                
                
                
                
                if Int(resp.userAnswer)==(list[indexPath.row].answer-1){
                    cell.optionLBL[Int(resp.userAnswer)].layer.backgroundColor = UIColor.green.cgColor
                    print()
                }
                    else{
                        cell.optionLBL[Int(resp.userAnswer)].layer.backgroundColor = UIColor.red.cgColor
                        print()
                    }
                }
             
            
            
            
            for option in cell.optionLBL{
                
                
                
                switch option.tag{
                case 0:
                    option.text = "  "+list[indexPath.row].options[option.tag]+"  "
                    option.sizeToFit()
                        if list[indexPath.row].options[option.tag].isEmpty{
                        option.isHidden = true
                       }
                 
                case 1:
                    option.text = "  "+list[indexPath.row].options[option.tag]+"  "
                    option.sizeToFit()
                        if list[indexPath.row].options[option.tag].isEmpty{
                        option.isHidden = true
                           
                    }
                   
                case 2:
                    option.text = "  "+list[indexPath.row].options[option.tag]+"  "
                    option.sizeToFit()
                        if list[indexPath.row].options[option.tag].isEmpty{
                        option.isHidden = true
                           
                    }
                case 3:
                    option.text = "  "+list[indexPath.row].options[option.tag]+"  "
                    option.sizeToFit()
                        if list[indexPath.row].options[option.tag].isEmpty{
                        option.isHidden = true
                           
                    }
                   
                default:
                    break
                }
                
            }
            
        }
        cell.questionTV.sizeToFit()
        cell.questionTV.isScrollEnabled = false
        
      
        
        
        
        return cell
    }
    
    
    
    func loadQuestions(){
        for question in questionList[constilationName!]!{
            
            if question.1==star!{
                list.append(question.0)
            }
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        do {
            resp = try UserResponse.fetchResponses(for: constilationName!, star: Int32(star!), in: AppDelegate.viewContext)
            
        } catch {
            print("Error while fetching the data \(error)")
        }
        
        var count = 0
        
        if let rec = resp{
            for response in rec{
                var i = 0
                for l in list{
                    if i==response.question && l.answer==response.userAnswer{
                        count = count+1
                        
                    }
                    i = i+1
                }
            }
        }
        
//        print(list.count)
//        print(count)
        
        if list.count==count{
            do {
                
                let record = try StarChecks.fetchRecord(for: constilationName!, star: Int32(star!), in: AppDelegate.viewContext)
                if let stars=try UserStars.fetchStar(forWorld: constilationName!, in: AppDelegate.viewContext){
                    
                if record == nil{
                        print(21)
                        try UserStars.update(world: constilationName!, star: "\(stars)⭐️", in: AppDelegate.viewContext)
                        try StarChecks.create(constilationName!, star: Int32(star!), flag: true, in: AppDelegate.viewContext)
                    displayAlert()
                    }
                }
                else{
                    print(22)
                    
                    if record == nil{
                        print(21)
                        try UserStars.create(constilationName!, star: "⭐️", in: AppDelegate.viewContext)
                        try StarChecks.create(constilationName!, star: Int32(star!), flag: true, in: AppDelegate.viewContext)
                        displayAlert()
                    }
                }
            }catch {
                print("Error while fetching the data \(error)")
            }
        }
        else{
            do {
                
                let record = try StarChecks.fetchRecord(for: constilationName!, star: Int32(star!), in: AppDelegate.viewContext)
                if let stars=try UserStars.fetchStar(forWorld: constilationName!, in: AppDelegate.viewContext){
                    if record != nil{
                        try UserStars.update(world: constilationName!, star: String(stars.prefix(stars.count - 1)), in: AppDelegate.viewContext)
                        try StarChecks.deleteRecord(for: constilationName!, star: Int32(star!), in: AppDelegate.viewContext)
                    }
                }

            }catch {
                print("Error while fetching the data \(error)")
            }
        }
    }
        
    func loadAnimation(){
        let AV = LottieAnimationView(name: "staranimation")
        AV.contentMode = .scaleToFill
        view.addSubview(AV)
        AV.play()
    }
    func displayAlert(){
        let alertController = UIAlertController(title: "Congrats🎉🎊", message: "You have earned a ⭐️", preferredStyle: .alert)


        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
        }

        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)

    }

}
