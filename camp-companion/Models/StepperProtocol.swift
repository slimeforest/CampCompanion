//
//  StepperProtocol.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import Foundation

protocol Stepper {
    func stepperWasPressed(didIncrease: Bool, namePassed: String, userindexPath: Int)
}
