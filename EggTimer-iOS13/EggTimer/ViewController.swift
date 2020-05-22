//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var timerLabel: UILabel!
    let time = [
        "soft": 3,
        "medium": 420,
        "hard": 720
    ]
    var totalTime = 0
    
    var secondsRemaining = 0

    @objc func updateTime() {
        if(secondsRemaining > 0) {
            secondsRemaining -= 1
            progressView.progress = Float(secondsRemaining) / Float(totalTime)
        } else {
            progressView.progress = 0
            timerLabel.text = "DONE"
            timer.invalidate()
        }
    }
    
    @IBAction func eggKeyPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle
        progressView.progress = 1.0
        let type = hardness!.components(separatedBy: " ")[0]
        
        timerLabel.text = type
        
        let key = type.lowercased()
        
        secondsRemaining = time[key]!
        totalTime = secondsRemaining
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
}
