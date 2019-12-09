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
    
    let colorMeaning = ["red", "orange", "yellow", "blue", "purple"]
    let colorDict: [String:UIColor] = [
        "red": UIColor.red,
        "orange": UIColor.orange,
        "yellow": UIColor.yellow,
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
    var totalTime = 59
    var isPaused = false
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var smallMeaningLabel: UILabel!
    @IBOutlet weak var downArrowLabel: UILabel!
    @IBOutlet weak var upArrowLabel: UILabel!
    @IBOutlet weak var smallTextColorLabel: UILabel!
    
    
    override func viewDidLoad() {
        gameOverLabel.isHidden = true
    }
    
    
    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        sender.isHidden = true // start game button disappears after being tapped
        
        gameOverLabel.isHidden = true
        meaningLabel.isHidden = false
        textColorLabel.isHidden = false
        yesButton.isHidden = false
        noButton.isHidden = false
        instructionsLabel.isHidden = false
        downArrowLabel.isHidden = false
        upArrowLabel.isHidden = false
        smallMeaningLabel.isHidden = false
        smallTextColorLabel.isHidden = false
        
        
        changeColorMeaning()
        changeTextColor()
        
        isPaused = false
        runTimer()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        updateScore(tappedYes: true)
        changeColorMeaning()
        changeTextColor()
    }
    @IBAction func noButtonTapped(_ sender: UIButton) {
        updateScore(tappedYes: false)
        changeColorMeaning()
        changeTextColor()
    }
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        // reset score back to 0
        score = 0
        scoreLabel.text = String(score)
        
        // change labels
        changeColorMeaning()
        changeTextColor()
        
        // restart timer
        isPaused = true
        timer.invalidate()
        totalTime = 59
        countdownLabel.text = String("01:00")
        
        // start game button reappears
        startGameButton.isHidden = false
    }
    
    // helper function to run countdown timer
    func runTimer(){
        isPaused = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    // helper function to decrease timer time
    @objc func updateTimer(){
        if totalTime >= 0 {
            let minutes = String(totalTime / 60)
            let seconds = String(totalTime % 60)
            countdownLabel.text = minutes + ":" + seconds
            totalTime -= 1
        }
        endGame()
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
    
    //game over function
    func endGame() {
        if totalTime == 0 {
            gameOverLabel.isHidden = false
            meaningLabel.isHidden = true
            textColorLabel.isHidden = true
            yesButton.isHidden = true
            noButton.isHidden = true
            instructionsLabel.isHidden = true
            downArrowLabel.isHidden = true
            upArrowLabel.isHidden = true
            smallMeaningLabel.isHidden = true
            smallTextColorLabel.isHidden = true
            
            restartButton.isHidden = false
        }
    }
    
    
}
