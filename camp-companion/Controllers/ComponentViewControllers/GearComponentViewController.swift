//
//  GearComponent.swift
//  camp-companion
//
//  Created by Jack Battle on 8/6/22.
//

import UIKit

class GearComponentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var arrayPosition: Int = 0
    
    // Data Sources
    var itemArray: [GearItem] = []
    var totalWeight1: Int = 0
    var totalWeight2: Int = 0
    var totalItems: Int = 0
    
    
    // IndexPath of the Tapped Cell
    var cellChosen = IndexPath()
    
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
    }
    
    //MARK: - UI Updater
    func updateUI() {
        addTotalWeight()
        addAllItems()
        gearTableView.reloadData()
    }
    
    // Adding Total Weight
    func addTotalWeight() {
        var addedWeight1: Int = 0
        var addedWeight2: Int = 0
        
        for item in itemArray {
            addedWeight1 += item.weight1 * item.quantity
            addedWeight2 += item.weight2 * item.quantity
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
            addedValue += item.quantity
        }
        totalItems = addedValue
        
        totalCountLabelOutlet.text = String("\(totalItems)")
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
        let continueAction = UIAlertAction(title: "Add", style: .default) { [self, weak alertController] _ in
            guard let textFields = alertController?.textFields else { return }
            
            if let userItemName = textFields[0].text,
               let userItemWeight1 = textFields[1].text,
               let userItemWeight2 = textFields[2].text,
               let userItemQuanity = textFields[3].text,
               let userItemNotes = textFields[4].text {
                
                let userSubmittedItem = GearItem(itemName: userItemName, itemImage: UIImage(systemName: "photo.on.rectangle.angled")!, itemWeight1: Int(userItemWeight1) ?? 0, itemWeight2: Int(userItemWeight2) ?? 0, itemQuantity: Int(userItemQuanity) ?? 1, itemNotes: userItemNotes ?? "")
                
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
    
    //MARK: - TableView and Cell creation/handling
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = gearTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GearComponentTableViewCell
        cell.itemName.text = itemArray[indexPath.row].name
        cell.itemImage.image = itemArray[indexPath.row].image
        cell.itemWeight1.text = String("\(itemArray[indexPath.row].weight1)")
        cell.itemWeight2.text = String("\(itemArray[indexPath.row].weight2)")
        cell.itemQuanity.text = String("\(itemArray[indexPath.row].quantity)")
        cell.itemNotes.text = itemArray[indexPath.row].notes
        cell.tableViewCellPosition = indexPath.row
        cell.delegate = self
        
        cell.itemImage.isUserInteractionEnabled = true
        return cell
    }
    
    //MARK: - Swiping and Tapping TableViewCell
    private func deleteItem(_ indexPath: IndexPath) {
        itemArray.remove(at: indexPath.row)
        gearTableView.reloadData()
        updateUI()
        print("Item Deleted")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.deleteItem(indexPath)
            completionHandler(true)
        }
        action.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellChosen = indexPath
        showPopUp(itemChosen: indexPath)
    }
    
    // Pop up logic
    func showPopUp(itemChosen: IndexPath) {
        let alert = UIAlertController(title: "Add Photo To Item", message: .none, preferredStyle: .actionSheet)
        
        // alert actions
        let action1 = UIAlertAction(title: "Take Photo", style: .default) { action in
            self.takePhoto(position: self.cellChosen)
        }
        let action2 = UIAlertAction(title: "Import Photo", style: .default) { action in
            self.importPhoto(position: itemChosen)
        }
        let action3 = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true,completion: nil)
    }
    
    // Taking a photo
    func takePhoto(position: IndexPath) {
        print("User chose to take photo")
        
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.delegate = self
        present(camera, animated: true) {
            print("cell tapped \(position)")
            self.cellChosen = position
        }
    }
    
    // Importing a photo
    func importPhoto(position: IndexPath) {        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true) {
            print("cell tapped \(position)")
            self.cellChosen = position
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
    
        dismiss(animated: true)
        
        let item = itemArray[cellChosen.row]
        let userSubmittedItem = GearItem(itemName: item.name, itemImage: image, itemWeight1: item.weight1, itemWeight2: item.weight2, itemQuantity: item.quantity, itemNotes: item.notes)
        
        itemArray[cellChosen.row] = userSubmittedItem
        self.updateUI()
    }
}

// Stepper Logic
extension GearComponentViewController: Stepper {
    
    func stepperWasPressed(didIncrease: Bool, namePassed: String, userindexPath: Int) {
        if didIncrease {
            arrayPosition = userindexPath
            itemArray[userindexPath].quantity += 1
            updateUI()
        }else {
            arrayPosition = userindexPath
            itemArray[userindexPath].quantity -= 1
            updateUI()
        }
    }
}
