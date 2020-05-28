//
//  pomodoroButton.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/28/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class resetUIButton: UIButton {
    override func draw(_ rect: CGRect) {
        layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        layer.borderWidth = 3
        layer.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
}
