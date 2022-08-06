//
//  GearComponentTableViewCell.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentTableViewCell: UITableViewCell {
    
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
        print("stepper pressed")
    }
    // Notes
    @IBOutlet weak var itemNotes: UILabel!



    
    
    

}
