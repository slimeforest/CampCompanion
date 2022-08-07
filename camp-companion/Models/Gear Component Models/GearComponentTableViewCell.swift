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
            print("up");
            sender.value = 0
            
        } else if (sender.value == -1) {
            print("down")
            sender.value = 0
            
        }
    }
    // Notes
    @IBOutlet weak var itemNotes: UILabel!



    
    
    

}
