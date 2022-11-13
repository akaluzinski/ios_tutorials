//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["Question A", "True"],
        ["Question B", "False"],
        ["Question C", "True"]
    ]
    
    var currentQuestion = 0
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let expectedAnswer = quiz[currentQuestion][1]
        
        if userAnswer == expectedAnswer {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if currentQuestion + 1 < quiz.count {
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
        
        rollQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rollQuestion()
                
    }

    func rollQuestion() {
        questionLabel.text = quiz[currentQuestion][0]
    }

}

