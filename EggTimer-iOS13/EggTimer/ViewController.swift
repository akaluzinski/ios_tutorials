//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    
    var remainingSeconds = 60
    var boilingTime = -1
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(sender.currentTitle!);
        timer.invalidate();
        
        let hardness = sender.currentTitle!
        boilingTime = eggTimes[hardness]!
        remainingSeconds = boilingTime
    
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updateTimer),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc func updateTimer() {
        status.text = getStatusText()
        if remainingSeconds > 0 {
            
            let progress = Float(boilingTime-remainingSeconds) / Float(boilingTime)
            
            print("\(remainingSeconds) seconds. \(progress)")
            remainingSeconds -= 1
            progressBar.progress = progress
        } else {
            timer.invalidate()
        }
        
    }
    
    func getStatusText() -> String {
        return remainingSeconds > 0 ? String(remainingSeconds) : "Done"
    }
}
