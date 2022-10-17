//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    @IBAction func keyPressed(_ sender: UIButton) {    
        playSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound() {
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}

