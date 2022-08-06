//
//  GearComponent.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentViewController: UIViewController, UITableViewDataSource {
    
    // TableView Outlet
    @IBOutlet weak var gearTableView: UITableView!
    // Bar Button Item
    @IBAction func addItemPressed(_ sender: Any) {
        print("Add Item button pressed.")
    }
    
    // Data Source
    let itemArray: [GearItem] = [
        GearItem(itemName: "Water Bottle", itemImage: UIImage(systemName: "plus")!, itemWeight1: 420, itemWeight2: 69, itemQuanity: 710, itemNotes: "This is a test item. Here are some words to go with it."),
        GearItem(itemName: "1 Gram Joints", itemImage: UIImage(systemName: "plus")!, itemWeight1: 0, itemWeight2: 1, itemQuanity: 15, itemNotes: "Blaze up!"),
        GearItem(itemName: "Sleeping Bag", itemImage: UIImage(systemName: "plus")!, itemWeight1: 645, itemWeight2: 12, itemQuanity: 1, itemNotes: "Goes down to 30 degrees C.")]
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        gearTableView.dataSource = self
        print("Gear Component View Controller successfully loaded.")
        // Do any additional setup after loading the view.
    }
    
    // TableView Protocol Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gearTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GearComponentTableViewCell
        cell.itemName.text = itemArray[indexPath.row].name
        cell.itemImage.image = itemArray[indexPath.row].image
        cell.itemWeight1.text = String("\(itemArray[indexPath.row].weight1)")
        cell.itemWeight2.text = String("\(itemArray[indexPath.row].weight2)")
        cell.itemQuanity.text = String("\(itemArray[indexPath.row].quanity)")
        cell.itemNotes.text = itemArray[indexPath.row].notes
    
        return cell
    }
    
}

