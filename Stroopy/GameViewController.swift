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
    }
    @IBAction func noButtonTapped(_ sender: Any) {
        print("no was tapped")
    }
    
    
}
