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
    @IBOutlet weak var breakTimeLabel: UILabel!
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var lunchTimeSlider: UISlider!
    @IBOutlet weak var breakTimeSlider: UISlider!
    @IBOutlet weak var workTimeSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       
    }
    
    @IBAction func workTimeChange(_ sender: UISlider) {
        //String(format: "%.2f", workTimeSlider.value) to have 2 decimal places but for now we use none
        workTimeLabel.text = "\(Int(workTimeSlider.value)) Min."
        
    }
    
    @IBAction func breakTimeChange(_ sender: UISlider) {
        breakTimeLabel.text = "\(Int(breakTimeSlider.value)) Min."
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

}
