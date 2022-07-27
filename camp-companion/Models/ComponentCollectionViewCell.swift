//
//  ComponentCollectionViewCell.swift
//  camp-companion
//
//  Created by Jack Battle on 7/27/22.
//

import UIKit

class ComponentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var componentLabelOutlet: UILabel!
    
    @IBOutlet weak var componentImageOutlet: UIImageView!
    
    func setup(with component: Component) {
        self.componentLabelOutlet.text = component.title
        self.componentImageOutlet.image = component.image
    }
    
}
