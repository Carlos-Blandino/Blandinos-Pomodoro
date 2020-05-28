//
//  SettingsVC.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/23/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    var myTimer = TimerBrain()
    
    @IBOutlet weak var lunchTimeLabel: UILabel!
    
    
    @IBOutlet weak var breakOneTimeLabel: UILabel!
    @IBOutlet weak var breakTwoTimeLabel: UILabel!
    @IBOutlet weak var breakThreeTimeLabel: UILabel!
    
    
    @IBOutlet weak var workTimeOneLabel: UILabel!
    @IBOutlet weak var workTimeTwoLabel: UILabel!
    @IBOutlet weak var workTimeThreeLabel: UILabel!
    @IBOutlet weak var workTimeFourLabel: UILabel!
    
    
    @IBOutlet weak var breakOneTimeSlider: UISlider!
    @IBOutlet weak var breakTwoTimeSlider: UISlider!
    @IBOutlet weak var breakThreeTimeSlider: UISlider!
    
    
    @IBOutlet weak var lunchTimeSlider: UISlider!
    
    @IBOutlet weak var workTimeOneSlider: UISlider!
    @IBOutlet weak var workTimeTwoSlider: UISlider!
    @IBOutlet weak var workTimeThreeSlider: UISlider!
    @IBOutlet weak var workTimeFourSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    
    
    @IBAction func workTimeChange(_ sender: UISlider) {
        //String(format: "%.2f", workTimeSlider.value) to have 2 decimal places but for now we use none
        workTimeFourLabel.text = "\(Int(workTimeFourSlider.value))"
        workTimeThreeLabel.text = "\(Int(workTimeThreeSlider.value))"
        workTimeTwoLabel.text = "\(Int(workTimeTwoSlider.value))"
        workTimeOneLabel.text = "\(Int(workTimeOneSlider.value))"
    }
    
    
    
    @IBAction func breakTimeChange(_ sender: UISlider) {
        breakThreeTimeLabel.text = "\(Int(breakThreeTimeSlider.value))"
        breakTwoTimeLabel.text = "\(Int(breakTwoTimeSlider.value))"
        breakOneTimeLabel.text = "\(Int(breakOneTimeSlider.value))"
    }
    
    @IBAction func lunchTimeChange(_ sender: UISlider) {
        lunchTimeLabel.text =  "\(Int(lunchTimeSlider.value))"
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "pomodoroVCSegue", sender: self)
    }
    @IBAction func unwindFromPomodoroVC(unwindSeque: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        myTimer.timerOne = Int(workTimeOneSlider.value)
        myTimer.breakOne = Int(breakOneTimeSlider.value)
        
        myTimer.timerTwo = Int(workTimeTwoSlider.value)
        myTimer.breakTwo = Int(breakTwoTimeSlider.value)
        
        myTimer.timerThree = Int(workTimeThreeSlider.value)
        myTimer.breakThree = Int(breakThreeTimeSlider.value)
        
        myTimer.timerFour = Int(workTimeFourSlider.value)
        myTimer.lunchBreak = Int(lunchTimeSlider.value)
        
        if segue.identifier == "pomodoroVCSegue" {
            let destinationVC = segue.destination as! PomodoroVC
            destinationVC.myTimer = myTimer
            
        }
    }
}
