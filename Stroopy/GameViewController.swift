//
//  GameViewController.swift
//  Stroopy
//
//  Created by Bo on 11/25/19.
//  Copyright © 2019 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit


class GameViewController: UIViewController{
    
    let colorMeaning = ["red", "orange", "yellow", "green", "blue", "purple"]
    let colorDict: [String:UIColor] = [
        "red": UIColor.red,
        "orange": UIColor.orange,
        "yellow": UIColor.yellow,
        "green": UIColor.green,
        "blue": UIColor.blue,
        "purple": UIColor.purple
    ]
    
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var textColorLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var countdownLabel: UILabel!
    var timer = Timer()
    var totalTime = 60
    var isTImeRunning = false
    @IBOutlet weak var startGameButton: UIButton!
    
    
    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        //insert code
        sender.isHidden = true
        changeColorMeaning()
        changeTextColor()
    }
    
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        updateScore(tappedYes: true)
        changeColorMeaning()
        changeTextColor()
        //        updateTimer()
    }
    @IBAction func noButtonTapped(_ sender: UIButton) {
        updateScore(tappedYes: false)
        changeColorMeaning()
        changeTextColor()
        //        updateTimer()
    }
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        // reset score back to 0
        score = 0
        scoreLabel.text = String(score)
        
        // change labels
        changeColorMeaning()
        changeTextColor()
        
        // restart timer
        countdownLabel.text = String("60")
        
        // start game button reappears
        startGameButton.isHidden = false 
    }
    
    // helper function to run countdown timer
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    // helper function to decrease timer time
    @objc func updateTimer(){
        totalTime -= 1
        countdownLabel.text = String(totalTime)
    }
    
    
    // helper function to change text in colorMeaningLabel
    func changeColorMeaning() {
        let randomIndex = Int.random(in: 0 ..< colorMeaning.count)
        meaningLabel.text = colorMeaning[randomIndex]
        addColortoText()
    }
    
    // helper function to change text in textColorLabel
    func changeTextColor() {
        let randomIndex = Int.random(in: 0 ..< colorMeaning.count)
        textColorLabel.text = colorMeaning[randomIndex]
    }
    
    //helper function to change physical color of textColorLabel
    func addColortoText() {
        self.meaningLabel.textColor = colorDict.randomElement()?.value
        self.textColorLabel.textColor = colorDict.randomElement()?.value
    }
    
    // update score label
    func updateScore(tappedYes: Bool) {
        
        if textColorLabel.textColor == colorDict[meaningLabel.text!] {
            print("yay -- match")
            if tappedYes{
                score += 10
            }else{
                score -= 10
            }
            scoreLabel.text = String(score)
        } else {
            print("boo -- no match")
            if tappedYes{
                score -= 10
            }else{
                score += 10
            }
            scoreLabel.text = String(score)
        }
    }
    
    
}
