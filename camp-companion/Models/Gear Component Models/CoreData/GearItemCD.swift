//
//  GearItemCD.swift
//  camp-companion
//
//  Created by Jack Battle on 9/22/22.
//

import Foundation
import CoreData

@objc(GearItemCD)

class GearItemCD: NSManagedObject {
    
    @NSManaged var name: String!
    @NSManaged var weight1: NSNumber!
    @NSManaged var weight2: NSNumber!
    @NSManaged var quantity: NSNumber!
    @NSManaged var notes: String!
}
