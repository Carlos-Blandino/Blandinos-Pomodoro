//
//  SettingsVC.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/23/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

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
        workTimeFourLabel.text = "\(Int(workTimeFourSlider.value)) Min."
        workTimeThreeLabel.text = "\(Int(workTimeThreeSlider.value)) Min."
        workTimeTwoLabel.text = "\(Int(workTimeTwoSlider.value)) Min."
        workTimeOneLabel.text = "\(Int(workTimeOneSlider.value)) Min."
    }
    
    
    
    @IBAction func breakTimeChange(_ sender: UISlider) {
        breakThreeTimeLabel.text = "\(Int(breakThreeTimeSlider.value)) Min."
        breakTwoTimeLabel.text = "\(Int(breakTwoTimeSlider.value)) Min."
     breakOneTimeLabel.text = "\(Int(breakOneTimeSlider.value)) Min."
    }
    
    @IBAction func lunchTimeChange(_ sender: UISlider) {
        lunchTimeLabel.text =  "\(Int(lunchTimeSlider.value)) Min."
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
        performSegue(withIdentifier: "pomodoroVCSeque", sender: self)
    }
    @IBAction func unwindFromPomodoroVC(unwindSeque: UIStoryboardSegue){
        
    }
}
