//
//  PracticeController.swift
//  Multiplier_Finder
//
//  Created by Brandon_Saunders on 10/29/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import Foundation
import UIKit

class PracticeController: UIViewController {
    var cardView: UIView!
    var back: UIImageView!
    var front: UIImageView!
    var showingBack: Bool = false
    var textView: UILabel!
    var current_factor: Int!
    var next_factor: Int!
    var starting_factor: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showingBack = false
        
        // Set the view background to white.
        self.view.backgroundColor = UIColor.white

        // Create a navigation bar.
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 44))
        self.view.addSubview(navBar);
        
        // Add the title and back button.
        let navItem = UINavigationItem(title: "Practice");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(returnToSelector));
        
        navItem.leftBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: true);
        
        // The initialized value from the selection menu.
        print("Value: "  + String(self.starting_factor))

        current_factor = self.starting_factor
        next_factor = 1
        
        // Create the UI flash card.
        front = UIImageView(image: UIImage(named: "blank.jpg"))
        back = UIImageView(image: UIImage(named: "blank.jpg"))
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(PracticeController.tapped))
        singleTap.numberOfTapsRequired = 1
        let rect = CGRect(x: front.frame.size.width/2, y: front.frame.size.height/2, width: (front.image?.size.width)!, height: (front.image?.size.height)!)
        
        cardView = UIView(frame: rect)
        cardView.center = view.center
        cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(singleTap)
        cardView.addSubview(back)
        
        let message = String(current_factor) + " X " + String(next_factor)
        superimposeText(card_information: String(message))
        
        view.addSubview(cardView)
        
    }
    
    func returnToSelector(_ sender: UIButton) {
        print("Button pressed")
        let secondViewController:Selector = Selector()
        self.dismiss(animated: true, completion: {})
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tapped() {
        print("tapped")
        
        if (self.showingBack == true) {
            print("Transitioning from back to front")
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            displayAnswer()
            
            next_factor! += 1
            
            self.showingBack = false
        } else {
            print("Transitioning from front to back")
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            displayQuestion()
            
            self.showingBack = true
        }
        
        
        if(next_factor! >= 13){
            next_factor! = 1
            current_factor! += 1
        }
    }
    
    
    func displayQuestion() {
        let message = String(current_factor) + " X " + String(next_factor)
        superimposeText(card_information: String(message))
    }
    
    func displayAnswer() {
        let product = current_factor * next_factor
        superimposeText(card_information: String(product))
    }
    
    func superimposeText(card_information: String) {
        print("Superimposing Text onto UIView in Practice Controller")
        // Initialize the rectangle that the text view will be placed in.
        self.textView = UILabel(frame: CGRect(x: back.frame.width/2, y: back.frame.height/2, width: back.frame.width, height: back.frame.height))
        self.textView.text = card_information
        self.textView.numberOfLines = 1
        self.textView.textAlignment = .center
        
        //self.textView.font = UIFont.systemFont(ofSize: 50)
        self.textView.adjustsFontSizeToFitWidth = true
        
        if(showingBack){
            self.textView.center = self.back.center
        } else {
            self.textView.center = self.back.center
        }
        cardView.addSubview(self.textView)
    }
    
    
    func buttonClicked() {
        print("Button clicked")
    }
    
    
}

