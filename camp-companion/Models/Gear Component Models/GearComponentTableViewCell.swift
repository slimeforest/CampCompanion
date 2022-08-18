//
//  GearComponentTableViewCell.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentTableViewCell: UITableViewCell {
    
    var delegate:Stepper?

    var tableViewCellPosition: Int! = nil
    
    // Image
    @IBOutlet weak var itemImage: UIImageView!
    
    
    // Name
    @IBOutlet weak var itemName: UILabel!
    
    // Weight
    @IBOutlet weak var itemWeight1: UILabel!
    @IBOutlet weak var itemWeight2: UILabel!
    
    // Quanity
    @IBOutlet weak var itemQuanity: UILabel!
    @IBAction func stepperPressed (_ sender: UIStepper!) {
        if (sender.value == 1) {
            sender.value = 0
            delegate?.stepperWasPressed(didIncrease: true, namePassed: itemName.text!, userindexPath: tableViewCellPosition)
        } else if (sender.value == -1) {
            sender.value = 0
            delegate?.stepperWasPressed(didIncrease: false, namePassed: itemName.text!, userindexPath: tableViewCellPosition)
        }
    }
    
    // Notes
    @IBOutlet weak var itemNotes: UILabel!
}
