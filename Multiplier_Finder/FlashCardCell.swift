//
//  MyCollectionViewCell.swift
//  Multiplier_Finder
//
//  Created by Brandon_Saunders on 10/29/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import UIKit

class FlashCardViewCell: UICollectionViewCell {
    var card_text: String!
    var card_image_view: UIImageView!
    var card_button: UIButton!
    
    override func awakeFromNib() {
        print("Card number:" + card_text)
        
        card_image_view = UIImageView(frame: contentView.frame)
        card_image_view.contentMode = .scaleAspectFill
        card_image_view.clipsToBounds = true
        contentView.addSubview(card_image_view)
        
        let x_value = contentView.frame.width - contentView.frame.width
        let y_value = (contentView.frame.height)/3
        let rectangle = CGRect(x: x_value, y: y_value, width: contentView.frame.width, height: 40)
        card_button = UIButton(frame: rectangle)
        card_button.backgroundColor = UIColor.darkGray
        card_button.setTitle(card_text, for: .normal)
        card_button.layer.cornerRadius = 3
        card_button.clipsToBounds = true
        card_button.addTarget(self, action: #selector(startPracticing), for: .touchUpInside)
        contentView.addSubview(card_button)
    }
    
    func startPracticing() {
        print("Starting practice with card: " + self.card_text)
    }
}
