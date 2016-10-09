//
//  ViewController.swift
//  Multiplier_Finder
//
//  Created by Brandon_Saunders on 10/8/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cardView: UIView!
    var back: UIImageView!
    var front: UIImageView!
    var showingBack = true
    var first_digits: Array = [0,1,2,3,4,5,6,7,8,9]
    var second_digits: Array = [0,1,2,3,4,5,6,7,8,9]
    var textView: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        front = UIImageView(image: UIImage(named: "front.jpg"))
        back = UIImageView(image: UIImage(named: "back.jpg"))
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped))
        singleTap.numberOfTapsRequired = 1
        
        let rect = CGRect(x: 20, y: 20, width: (back.image?.size.width)!, height: (back.image?.size.height)!)
        
        cardView = UIView(frame: rect)
        cardView.center = view.center
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        
        cardView.addSubview(back)
        
        superimposeText(card_information: "")
        
        view.addSubview(cardView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tapped() {
        print("tapped")
        
        
        if (showingBack) {
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            superimposeText(card_information: "Front")

            showingBack = false
        } else {
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            superimposeText(card_information: "Back")
            showingBack = true
        }
    }
    
    
    func multiply(first_digit: Int, second_digit: Int) -> Int {
        print("Multiplying two digits and returning their product.")
        let product = first_digit * second_digit
        return product
    }
    
    
    func superimposeText(card_information: String) {
        print("Superimposing Text onto UIView")
        
        /*
        let subViews = self.cardView.subviews
        
        for subView in subViews {
            if(subView is UILabel){
                subView.removeFromSuperview()
            }
        }
 */
        
        self.textView = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        self.textView.text = card_information
        self.textView.numberOfLines = 1
        self.textView.font = UIFont.systemFont(ofSize: 14)
        self.textView.center = self.front.center
        cardView.addSubview(self.textView)

    }


}

