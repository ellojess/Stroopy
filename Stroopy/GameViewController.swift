//
//  GameViewController.swift
//  Stroopy
//
//  Created by Bo on 11/25/19.
//  Copyright © 2019 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import GameKit

class GameViewController: UIViewController{
    
    let colorMeaning = ["black", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink"]
    
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var textColorLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        print("yes was tapped")
        changeColorMeaning()
        changeTextColor()
    }
    @IBAction func noButtonTapped(_ sender: Any) {
        print("no was tapped")
        changeColorMeaning()
        changeTextColor()
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
        let black = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let brown = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
        let red = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        let orange = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        let yellow = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        let green = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        let blue = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        let purple = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        let pink = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        self.meaningLabel.textColor = [black, brown, red, orange, yellow, green, blue, purple, pink].randomElement()
        self.textColorLabel.textColor = [black, brown, red, orange, yellow, green, blue, purple, pink].randomElement()
    }
    
}
