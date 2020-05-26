//
//  ViewController.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/14/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class PomodoroVC: UIViewController {

    
    var timerOne: String?
    var breakOne: String?
    var timerTwo: String?
    var breakTwo: String?
    var timerThree: String?
    var breakThree: String?
    var timerFour: String?
    var lunchBreak: String?
    var mainTime = Timer()
    var timer: Int = 0
    @IBOutlet weak var workTimeLabel: UILabel!
   
    
    @IBOutlet weak var timerOneButton: UIButton!
    
    @IBOutlet weak var timerTwoButton: UIButton!
    
    @IBOutlet weak var timerThreeButton: UIButton!
    
    @IBOutlet weak var timerFourButton: UIButton!
    
    @IBOutlet weak var startBreakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Int(timerOne!)! * Int(60)
        
        // Do any additional setup after loading the view.
        timerOneButton.setTitle(timerOne! + "/" + breakOne!, for: .normal)
        timerTwoButton.setTitle(timerTwo! + "/" + breakTwo!, for: .normal)
        timerThreeButton.setTitle(timerThree! + "/" + breakThree!, for: .normal)
        timerFourButton.setTitle(timerFour! + "/" + lunchBreak!, for: .normal)
        workTimeLabel.text = timerOne! + ":00"
        startBreakButton.isHidden = true
    }

    @IBAction func promodoroPressed(_ sender: UIButton) {
        
    }
    

    @IBAction func timerOnePressed(_ sender: UIButton) {
        mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
        
    }
    @objc func updateWorkTime(){
        if timer != 0 {
            
            
            var minutes = String(timer/60)
            
            var seconds = String(Int(timer) % 60)
            
            switch seconds {
                
            case "0","1","2","3","4","5","6","7","8","9":
               seconds = "0" + seconds
            default:
                break
            }
            workTimeLabel.text = "\(minutes):\(seconds)"
            
             timer -= 1

            print(timer)
        } else {
            startBreakButton.isHidden  = false
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

