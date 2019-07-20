//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //----properties----//
    let allQuestions = QuestionHolder()
    let boolMatrix = [false, true]
    var curQuestionIndex = 0
    var score = 0
    
    //----outlets----//
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // display initial UI
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        // find out which button was pressed and send T or F value to check Answer
        score += checkAnswer(boolMatrix[sender.tag - 1])
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(curQuestionIndex+1)/13"
        progressBar.frame.size.width = view.frame.size.width/13 * CGFloat(curQuestionIndex+1)
        questionLabel.text = allQuestions.list[curQuestionIndex].questionText
    }
    

    func nextQuestion() {
        print(curQuestionIndex)
        if (curQuestionIndex < 12) {
            curQuestionIndex += 1
        } else {
            let alert = UIAlertController(title: "Quiz Over", message: "You answered " + String(score) + " right.", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Try Again?", style: .destructive) {
                (UIAlertAction) in
                    self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer(_ val: Bool) -> Int {
        // if answer == picked answer then add a point to the score
        if val == allQuestions.list[curQuestionIndex].answer {
            ProgressHUD.showSuccess("correct")
            return 1
        } else {
            ProgressHUD.showError("Wrong")
            return 0
        }
        
    }
    
    
    func startOver() {
        curQuestionIndex = 0
        score = 0
        updateUI()
    }
    
}
