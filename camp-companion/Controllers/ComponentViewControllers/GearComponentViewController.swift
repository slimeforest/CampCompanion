//
//  GearComponent.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentViewController: UIViewController, UITableViewDataSource {
    
    // Data Source
    var itemArray: [GearItem] = []
    //    var itemArray: [GearItem] = [
    //        GearItem(itemName: "Water Bottle", itemImage: UIImage(systemName: "plus")!, itemWeight1: 420, itemWeight2: 69, itemQuanity: 710, itemNotes: "This is a test item. Here are some words to go with it."),
    //        GearItem(itemName: "1 Gram Joints", itemImage: UIImage(systemName: "plus")!, itemWeight1: 0, itemWeight2: 1, itemQuanity: 15, itemNotes: "Blaze up!"),
    //        GearItem(itemName: "Sleeping Bag", itemImage: UIImage(systemName: "plus")!, itemWeight1: 645, itemWeight2: 12, itemQuanity: 1, itemNotes: "Goes down to 30 degrees C.")]
    
    // TableView Outlet
    @IBOutlet weak var gearTableView: UITableView!
    // Bar Button Item
    @IBAction func addItemPressed(_ sender: Any) {
        presentAlert()
    }
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        gearTableView.dataSource = self
        print("Gear Component View Controller successfully loaded.")
        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableView protocol functions
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
    
    
    //MARK: - Alert
    func presentAlert() {
        let alertController = UIAlertController(title: "Add Item",
                                                message: "Enter item info here",
                                                preferredStyle: .alert)
        
        // AlertController Textfields
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Weight 1"
            textField.keyboardType = .decimalPad
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Weight 2"
            textField.keyboardType = .decimalPad
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Quanity"
            textField.keyboardType = .decimalPad
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Notes"
        }
        
        // AlertController Actions
        let continueAction = UIAlertAction(title: "Add",
                                           style: .default) { [self, weak alertController] _ in
            guard let textFields = alertController?.textFields else { return }
            
            if let userItemName = textFields[0].text,
               let userItemWeight1 = textFields[1].text,
               let userItemWeight2 = textFields[2].text,
               let userItemQuanity = textFields[3].text,
               let userItemNotes = textFields[4].text{
                print("Name: \(userItemName)")
                print("Item Weight 1: \(userItemWeight1)")
                print("Item Weight 2: \(userItemWeight2)")
                print("Item Quanity: \(userItemQuanity)")
                print("Item Notes: \(userItemNotes)")
                
                let userSubmittedItem = GearItem(itemName: userItemName, itemImage: UIImage(systemName: "plus")!, itemWeight1: Int(userItemWeight1) ?? 0, itemWeight2: Int(userItemWeight2) ?? 0, itemQuanity: Int(userItemQuanity) ?? 999, itemNotes: userItemNotes)
                
                self.itemArray.append(userSubmittedItem)
                gearTableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(continueAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController,
                     animated: true)
    }
}

