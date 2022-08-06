//
//  COmponent.swift
//  camp-companion
//
//  Created by Jack Battle on 7/27/22.
//

import Foundation
import UIKit

class Component{
    let title: String
    let image: UIImage
    let segueName: String
    
    init(componentName: String, componentImage: UIImage, segue: String) {
        title = componentName
        image = componentImage
        segueName = segue
    }
}


