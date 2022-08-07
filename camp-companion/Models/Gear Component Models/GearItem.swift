//
//  GearItem.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import Foundation
import UIKit

class GearItem{
    let name: String
    let image: UIImage
    let weight1: Int
    let weight2: Int
    var quantity: Int
    let notes: String
    let arrayPosition: Int
    
    init(itemName: String, itemImage: UIImage, itemWeight1: Int, itemWeight2: Int, itemQuantity: Int, itemNotes: String, creationPosition: Int) {
        name = itemName
        image = itemImage
        weight1 = itemWeight1
        weight2 = itemWeight2
        quantity = itemQuantity
        notes = itemNotes
        arrayPosition = creationPosition
    }
}
