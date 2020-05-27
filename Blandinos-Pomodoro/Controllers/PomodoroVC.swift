//
//  ViewController.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/14/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class PomodoroVC: UIViewController {

    var myTimer: TimerBrain?
    var timerOne: String?
    var breakOne: String?
    var timerTwo: String?
    var breakTwo: String?
    var timerThree: String?
    var breakThree: String?
    var timerFour: String?
    var lunchBreak: String?
    var mainTime = Timer()
    
    @IBOutlet weak var workTimeLabel: UILabel!
   
    
    @IBOutlet weak var timerOneButton: UIButton!
    
    @IBOutlet weak var timerTwoButton: UIButton!
    
    @IBOutlet weak var timerThreeButton: UIButton!
    
    @IBOutlet weak var timerFourButton: UIButton!
    
    @IBOutlet weak var startBreakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
        
        // Do any additional setup after loading the view.
        timerOneButton.setTitle("\(myTimer!.timerOne!)/\(myTimer!.breakOne!)", for: .normal)
        timerTwoButton.setTitle("\(myTimer!.timerTwo!)/\(myTimer!.breakTwo!)", for: .normal)
        timerThreeButton.setTitle("\(myTimer!.timerThree!)/\(myTimer!.breakThree!)", for: .normal)
        timerFourButton.setTitle("\(myTimer!.timerFour!)/\(myTimer!.lunchBreak!)", for: .normal)
        workTimeLabel.text = "\(myTimer!.timerOne!):00"
        startBreakButton.isHidden = true
    }



    @IBAction func timerOnePressed(_ sender: UIButton) {
        mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
        
    }
    @objc func updateWorkTime(){
        if myTimer!.timer != 0 {

        workTimeLabel.text = myTimer?.timeToString()
            
        } else {
            
            startBreakButton.isHidden  = false
            
            mainTime.invalidate()
        }
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

