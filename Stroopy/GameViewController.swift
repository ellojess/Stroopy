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
//    let textColor = ["black", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink"]
    
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
    
    
    // helper function to change color meaning text
    func changeColorMeaning() {
        let randomIndex = Int.random(in: 0 ..< colorMeaning.count)
        meaningLabel.text = colorMeaning[randomIndex]
    }
    
        func changeTextColor() {
            let randomIndex = Int.random(in: 0 ..< colorMeaning.count)
            textColorLabel.text = colorMeaning[randomIndex]
        }

    
}
