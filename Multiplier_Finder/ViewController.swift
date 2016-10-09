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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        front = UIImageView(image: UIImage(named: "front.jpg"))
        back = UIImageView(image: UIImage(named: "back.jpg"))
        
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        singleTap.numberOfTapsRequired = 1
        
        
        let rect = CGRect(x: 20, y: 20, width: (back.image?.size.width)!, height: (back.image?.size.height)!)
        
        cardView = UIView(frame: rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        
        cardView.addSubview(back)
        
        view.addSubview(cardView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tapped() {
        print("tapped")
    }


}

