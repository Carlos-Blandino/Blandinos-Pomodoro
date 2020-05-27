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
   
    var mainTime = Timer()
    

    @IBOutlet weak var timerDescriptionLabel: UILabel!
    
    @IBOutlet weak var workTimeLabel: UILabel!
    
    @IBOutlet weak var timerOneButton: UIButton!
    
    @IBOutlet weak var timerTwoButton: UIButton!
    
    @IBOutlet weak var timerThreeButton: UIButton!
    
    @IBOutlet weak var timerFourButton: UIButton!
    
    @IBOutlet weak var startBreakButton: UIButton!
    
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("view did load")
        resetView()
    }
 
    func resetView() {
        timerOneButton.isEnabled = true
        timerTwoButton.isEnabled = false
        timerThreeButton.isEnabled = false
        timerFourButton.isEnabled = false
        
        timerOneButton.setTitle("\(myTimer!.timerOne!)/\(myTimer!.breakOne!)", for: .normal)
           timerTwoButton.setTitle("\(myTimer!.timerTwo!)/\(myTimer!.breakTwo!)", for: .normal)
           timerThreeButton.setTitle("\(myTimer!.timerThree!)/\(myTimer!.breakThree!)", for: .normal)
           timerFourButton.setTitle("\(myTimer!.timerFour!)/\(myTimer!.lunchBreak!)", for: .normal)
           workTimeLabel.text = "\(myTimer!.timerOne!):00"
        startBreakButton.isEnabled = false
        myTimer?.breakNumber = 0
        timerDescriptionLabel.text = "Timer 1:"
    }

    @IBAction func timerOnePressed(_ sender: UIButton) {
        if mainTime.isValid {
            mainTime.invalidate()
        } else {
            myTimer!.breakTime = (myTimer?.breakOne!)! * Int(60)
            myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
            
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 1
        }
        
        
    }
    @objc func updateWorkTime(){
        if myTimer!.timer != 0 {

            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
            
        } else {


           //check if break is over from the last segue

            startBreakButton.isEnabled  = true

            mainTime.invalidate()

        }
    }
    @IBAction func timerTwoPressed(_ sender: UIButton) {
        if mainTime.isValid {
            mainTime.invalidate()
        } else {
            myTimer!.breakTime = (myTimer?.breakTwo!)! * Int(60)
            myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 2
        }
        
    }
    
    @IBAction func timerThreePressed(_ sender: UIButton) {
        if mainTime.isValid {
            mainTime.invalidate()
        } else {
            myTimer!.breakTime = (myTimer?.breakThree!)! * Int(60)
            myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 3
        }
        
    }
    
    @IBAction func timerFourPressed(_ sender: UIButton) {
        if mainTime.isValid {
            mainTime.invalidate()
        } else {
            myTimer!.breakTime = (myTimer?.lunchBreak!)! * Int(60)
            myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 4
        }
    
        
    }
    
    @IBAction func startBreakPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "breakTimeVCSeque", sender: self)
        switch myTimer!.breakNumber {
        case 1:
            timerDescriptionLabel.text = "Timer 1:"
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = true
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            workTimeLabel.text = "\(myTimer!.timerOne!):00"
        case 2:
            timerDescriptionLabel.text = "Timer 2:"
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = true
            timerFourButton.isEnabled = false
            workTimeLabel.text = "\(myTimer!.timerTwo!):00"
        case 3:
            timerDescriptionLabel.text = "Timer 3:"
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = true
            workTimeLabel.text = "\(myTimer!.timerThree!):00"
        case 4:
            timerDescriptionLabel.text = "Timer 4:"
            timerOneButton.isEnabled = true
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            workTimeLabel.text = "\(myTimer!.timerFour!):00"
        default:
            break
        }
        
        startBreakButton.isEnabled = false
    }

    
    @IBAction func unwindFromStartBreakVC(storyboard: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "breakTimeVCSeque" {
            let destinationVC = segue.destination as! BreakTimeVC
            destinationVC.myBreakTimer = myTimer!
        }
    }
    
}

