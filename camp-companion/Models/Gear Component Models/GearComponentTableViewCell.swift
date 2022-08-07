//
//  GearComponentTableViewCell.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentTableViewCell: UITableViewCell {
    
    var mainVC = GearComponentViewController()
    var tableViewCellPosition: Int! = nil
    
    // Image
    @IBOutlet weak var itemImage: UIImageView!
    @IBAction func imagePressed (_ sender: UIImageView!) {
        print("ImageView Pressed.")
    }
    
    // Name
    @IBOutlet weak var itemName: UILabel!
    
    // Weight
    @IBOutlet weak var itemWeight1: UILabel!
    @IBOutlet weak var itemWeight2: UILabel!
    
    // Quanity
    @IBOutlet weak var itemQuanity: UILabel!
    @IBAction func stepperPressed (_ sender: UIStepper!){
        if (sender.value == 1) {
            print("up and item: \(itemName.text!)");
            sender.value = 0
            mainVC.stepperWasPressed(didIncrease: true, namePassed: itemName.text!, userindexPath: tableViewCellPosition)
        } else if (sender.value == -1) {
            print("down and item: \(itemName.text!)");
            sender.value = 0
            mainVC.stepperWasPressed(didIncrease: false, namePassed: itemName.text!, userindexPath: tableViewCellPosition)
        }
    }
    
    // Notes
    @IBOutlet weak var itemNotes: UILabel!
}
