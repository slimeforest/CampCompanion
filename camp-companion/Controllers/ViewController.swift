//
//  ViewController.swift
//  camp-companion
//
//  Created by Jack Battle on 7/25/22.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1Value: UILabel!
    @IBOutlet weak var label2Value: UILabel!
    
    
    
    @IBOutlet weak var componentCollectionView: UICollectionView!
    
    let componentArray: [Component] = [
        Component(componentName: "Gear", componentImage: UIImage(systemName: "bag.fill")!, segue: "gearComponentSegue"),
        Component(componentName: "Compass", componentImage: UIImage(systemName: "safari.fill")!, segue: "compassComponentSegue"),
        Component(componentName: "Maps", componentImage: UIImage(systemName: "map.fill")!, segue: "mapComponentSegue"),
        Component(componentName: "Springs", componentImage: UIImage(systemName: "humidity.fill")!, segue: "springsComponenViewController"),
        Component(componentName: "Weather", componentImage: UIImage(systemName: "cloud.sun.fill")!, segue: "weatherComponentSegue"),
        Component(componentName: "Another Test Component", componentImage: UIImage(systemName: "gear")!, segue: "testComponentSegue")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("test is successful")
        componentCollectionView.dataSource = self
        componentCollectionView.delegate = self
        componentCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

    //MARK: - buttons
    @IBAction func button1Pressed(_ sender: Any) {
        print("button 1 pressed")
    }
    @IBAction func button2Pressed(_ sender: Any) {
        print("button 2 pressed")
    }
    @IBAction func button3Pressed(_ sender: Any) {
        print("button 3 pressed")
    }
    @IBAction func button4Pressed(_ sender: Any) {
        print("button 4 pressed")
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return componentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComponentCollectionViewCell", for: indexPath) as! ComponentCollectionViewCell
        cell.setup(with: componentArray[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var columns: CGFloat = 2
        
        let spacing: CGFloat = 5
        let totalHorizontalSpacing = (columns - 1) * spacing
        
        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
        let itemSize = CGSize(width: itemWidth, height: itemWidth * 1.1)
        
        return itemSize
        
        
//        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item: \(componentArray[indexPath.row].title)")
        
        performSegue(withIdentifier: "\(componentArray[indexPath.row].segueName)", sender: self)
    }
    
}
