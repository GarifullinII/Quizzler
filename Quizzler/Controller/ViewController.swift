//
//  ViewController.swift
//  Quizzler
//
//  Created by Ildar Garifullin on 25/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {
            return
        }
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .yellow
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        oneButton.setTitle(answerChoices[0], for: .normal)
        twoButton.setTitle(answerChoices[1], for: .normal)
        threeButton.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
                
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        oneButton.backgroundColor = .clear
        twoButton.backgroundColor = .clear
        threeButton.backgroundColor = .clear
    }
}

