//
//  ViewController.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/14/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class PomodoroVC: UIViewController {

    @IBOutlet weak var breakTimeLabel: UILabel!
   
    
    @IBOutlet weak var timerOne: UIButton!
    
    @IBOutlet weak var timerTwo: UIButton!
    
    @IBOutlet weak var timerThree: UIButton!
    
    @IBOutlet weak var timerFour: UIButton!
    
    @IBOutlet weak var breakTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func promodoroPressed(_ sender: UIButton) {
        
    }
    

    @IBAction func timerOnePressed(_ sender: UIButton) {
    }
    
    @IBAction func timerTwoPressed(_ sender: UIButton) {
    }
    
    @IBAction func timerThreePressed(_ sender: UIButton) {
    }
    
    @IBAction func timerFourPressed(_ sender: UIButton) {
    }
    
    @IBAction func startBreakPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "breakTimeVCSeque", sender: self)
    }
    
    @IBAction func unwindFromStartBreakVC(storyboard: UIStoryboardSegue){
        
    }
    
}

