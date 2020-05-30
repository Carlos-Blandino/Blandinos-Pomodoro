//
//  ViewController.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/14/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit
import AVFoundation

class PomodoroVC: UIViewController {
    
    var player = AVAudioPlayer()
    
    var myTimer: TimerBrain?
    
    var mainTime = Timer()
    
    var buttonState = false
    
    @IBOutlet weak var timerDescriptionLabel: UILabel!
    
    @IBOutlet weak var workTimeLabel: UILabel!
    
    @IBOutlet weak var timerOneButton: UIButton!
    
    @IBOutlet weak var timerTwoButton: UIButton!
    
    @IBOutlet weak var timerThreeButton: UIButton!
    
    @IBOutlet weak var timerFourButton: UIButton!
    
    @IBOutlet weak var startBreakButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        timerOneButton.setTitle("T1-\(myTimer!.timerOne!)/\(myTimer!.breakOne!)", for: .normal)
        timerTwoButton.setTitle("T2-\(myTimer!.timerTwo!)/\(myTimer!.breakTwo!)", for: .normal)
        timerThreeButton.setTitle("T3-\(myTimer!.timerThree!)/\(myTimer!.breakThree!)", for: .normal)
        timerFourButton.setTitle("T4-\(myTimer!.timerFour!)/\(myTimer!.lunchBreak!)", for: .normal)
        resetView()
        timerOneButton.isEnabled = true
        timerTwoButton.isEnabled = false
        timerThreeButton.isEnabled = false
        timerFourButton.isEnabled = false
    }
    
    @IBAction func backToSettings(_ sender: UIButton) {
        mainTime.invalidate()
    }
    func resetView() {
       
        timerOneButton.isEnabled = true
        timerTwoButton.isEnabled = true
        timerThreeButton.isEnabled = true
        timerFourButton.isEnabled = true
        workTimeLabel.text = "00:00" 
        startBreakButton.isHidden = true
        myTimer?.breakNumber = 0
        timerDescriptionLabel.text = "Timer:"
    }
    
    @IBAction func timerOnePressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.breakOne!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerOne!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 1
            buttonState = true
            timerOneButton.isEnabled = true
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            timerDescriptionLabel.text = "Timer 1:"
            UIApplication.shared.isIdleTimerDisabled = true

        }
    }
   
    @IBAction func timerTwoPressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.breakTwo!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerTwo!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 2
            buttonState = true
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = true
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            timerDescriptionLabel.text = "Timer 2:"
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
    
    @IBAction func timerThreePressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.breakThree!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerThree!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 3
            buttonState = true
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = true
            timerFourButton.isEnabled = false
            timerDescriptionLabel.text = "Timer 3:"
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
    
    @IBAction func timerFourPressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.lunchBreak!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerFour!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 4
            buttonState = true
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = true
            timerDescriptionLabel.text = "Timer 4:"
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
    
    @objc func updateWorkTime(){
        if myTimer!.workTime >= 0 {
            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
            if myTimer?.workTime == 0 {
                playAlarm()
            }
        } else {
            //startBreakButton.isEnabled  = true
            startBreakButton.isHidden = false
            UIApplication.shared.isIdleTimerDisabled = false
            mainTime.invalidate()
        }
    }
    
    
    @IBAction func startBreakPressed(_ sender: UIButton) {

        buttonState = false
        performSegue(withIdentifier: "breakTimeVCSeque", sender: self)
        switch myTimer!.breakNumber {
        case 1:
            myTimer!.breakTime = (myTimer?.breakTwo!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerTwo!)! * Int(60)
            timerDescriptionLabel.text = "Timer 2:"
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = true
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
        case 2:
            myTimer!.breakTime = (myTimer?.breakThree!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerThree!)! * Int(60)
            timerDescriptionLabel.text = "Timer 3:"
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = true
            timerFourButton.isEnabled = false
            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
        case 3:
            myTimer!.breakTime = (myTimer?.lunchBreak!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerFour!)! * Int(60)
            timerDescriptionLabel.text = "Timer 4:"
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = true
            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
        case 4:
            myTimer!.breakTime = (myTimer?.breakOne!)! * Int(60)
            myTimer!.workTime = (myTimer?.timerOne!)! * Int(60)
            timerDescriptionLabel.text = "Timer 1:"
            timerOneButton.isEnabled = true
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
            
        default:
            break
        }
        
        startBreakButton.isHidden = true
    }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarms_sound", withExtension: "mp3")

        if let goodUrl = url {
            do {
                player = try AVAudioPlayer(contentsOf: goodUrl)
                player.play()
            } catch {
                print("something went wrong with audio player")
            }
        } else {
            print("something went wrong with audio file")
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
            mainTime.invalidate()
            resetView()
            buttonState = false
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

