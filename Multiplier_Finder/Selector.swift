//
//  Multiplier_Selector.swift
//  Multiplier_Finder
//
//  Created by Brandon_Saunders on 10/23/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import Foundation
import UIKit

class Selector: UIViewController
{
    var collectionView: UICollectionView!
    let base_image = UIImage(named: "blank")
    var images = [UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank"), UIImage(named: "blank")]
    
    var main_view: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading view in Selector")
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        main_view = UIView(frame: CGRect(x: 0, y: 46, width: view.frame.width, height: view.frame.height))
        
        // Add spacing around each cell.
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        // Set each cell size to the size of the image.
        layout.estimatedItemSize = CGSize(width: (base_image?.size.width)!, height: (base_image?.size.height)!)
        
        // Set the collection view to the size of the view frame.
        collectionView = UICollectionView(frame: main_view.frame, collectionViewLayout: layout)
        
        // Register all images with the FlashCardViewCell object.
        collectionView.register(FlashCardViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Set the background color.
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Add the collections view to the main view.
        view.addSubview(collectionView)
}
    
    
    
    func startPracticing(sender:UIButton!) {
        // Transition to the Practice screen.
        print("Button pressed")
        print(sender.accessibilityHint)
        
        // Initialize the Practice view controller.
        let secondViewController:PracticeController = PracticeController()
        
        // Set the value to be practiced.
        //secondViewController.starting_factor = String(describing: sender.accessibilityHint)
        //secondViewController.starting_factor = String(describing:sender.accessibilityValue)
        secondViewController.starting_factor = sender.tag
        
        // Remove the Selector view controller.
        self.dismiss(animated: true, completion: {})
        
        // Clean up the collection view.
        self.collectionView.resignFirstResponder()
        
        // Present the Practice view controller to the user.
        self.present(secondViewController, animated: true, completion: nil)
    }

    
}


extension Selector: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let contentView = cell.contentView
        let card_image_view = UIImageView(image: base_image)
        
        card_image_view.contentMode = .scaleAspectFill
        card_image_view.clipsToBounds = true
        contentView.addSubview(card_image_view)
        
        let x_value = contentView.frame.width - contentView.frame.width
        let y_value = (contentView.frame.height)/3
        let rectangle = CGRect(x: x_value, y: y_value, width: contentView.frame.width, height: 40)
        let card_button = UIButton(frame: rectangle)
        
        card_button.backgroundColor = UIColor.darkGray
        let card_number = indexPath.item + 1
        let card_text = String(indexPath.item + 1)
        card_button.setTitle(card_text, for: .normal)
        card_button.layer.cornerRadius = 3
        card_button.clipsToBounds = true
        card_button.tag = card_number
        //card_button.accessibilityValue = String(describing: card_text)
        card_button.addTarget(self,action: #selector(startPracticing), for: .touchUpInside)
        contentView.addSubview(card_button)

        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //let cardCell = cell as! FlashCardViewCell
        //cardCell.card_image_view.image = images[indexPath.row]
    }
    
}



