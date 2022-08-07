//
//  GearComponent.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Data Source
    var itemArray: [GearItem] = []
    var totalWeight1: Int = 0
    var totalWeight2: Int = 0
    var totalItems: Int = 0
    
    // Weight Label Outlets
    @IBOutlet weak var weight1LabelOutlet: UILabel!
    @IBOutlet weak var weight2LabelOutlet: UILabel!
    
    // Item Count Label Outlet
    
    @IBOutlet weak var totalCountLabelOutlet: UILabel!
    
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
        gearTableView.delegate = self
        print("Gear Component View Controller successfully loaded.")
        
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UI Updater
    func updateUI() {
        addTotalWeight()
        addAllItems()
    }
    
    // Adding Total Weight
    func addTotalWeight() {
        var addedWeight1: Int = 0
        var addedWeight2: Int = 0
        
        for item in itemArray {
            addedWeight1 += item.weight1 * item.quanity
            addedWeight2 += item.weight2 * item.quanity
        }
        
        totalWeight1 = addedWeight1
        totalWeight2 = addedWeight2
        
        weight1LabelOutlet.text = String("\(totalWeight1)")
        weight2LabelOutlet.text = String("\(totalWeight2)")
    }
    
    // Item Count
    func addAllItems() {
        var addedValue: Int = 0
        
        for item in itemArray {
            addedValue += item.quanity
        }
        totalItems = addedValue
    
        totalCountLabelOutlet.text = String("\(totalItems)")
        print("Total items: \(totalItems)")
    }
    
    func increase() {
        totalItems += 1
    }
    func decrease() {
        totalItems -= 1
    }
    
    
    //MARK: - Alert
    func presentAlert() {
        let alertController = UIAlertController(title: "Add Item", message: "Enter item info here", preferredStyle: .alert)
        
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
               let userItemNotes = textFields[4].text {
                
                print("Name: \(userItemName)")
                print("Item Weight 1: \(userItemWeight1)")
                print("Item Weight 2: \(userItemWeight2)")
                print("Item Quanity: \(userItemQuanity)")
                print("Item Notes: \(userItemNotes)")
                
                let userSubmittedItem = GearItem(itemName: userItemName, itemImage: UIImage(systemName: "photo.on.rectangle.angled")!, itemWeight1: Int(userItemWeight1) ?? 0, itemWeight2: Int(userItemWeight2) ?? 0, itemQuanity: Int(userItemQuanity) ?? 1, itemNotes: userItemNotes ?? "")
                
                self.itemArray.append(userSubmittedItem)
                gearTableView.reloadData()
                updateUI()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(continueAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController,
                     animated: true)
    }

    //MARK: - TableView Protocol Functions
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

//MARK: - Swipeable TableViewCell
    private func deleteItem(_ indexPath: IndexPath) {
        itemArray.remove(at: indexPath.row)
        gearTableView.reloadData()
        updateUI()
        print("Item Deleted")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.deleteItem(indexPath)
                                            completionHandler(true)
        }
        action.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [action])
        
    }
}

