//
//  MyCollectionViewCell.swift
//  Multiplier_Finder
//
//  Created by Brandon_Saunders on 10/29/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import UIKit

class FlashCardViewCell: UICollectionViewCell {
    var card_image_view: UIImageView!
    
    override func awakeFromNib() {
        card_image_view = UIImageView(frame: contentView.frame)
        card_image_view.contentMode = .scaleAspectFill
        card_image_view.clipsToBounds = true
        contentView.addSubview(card_image_view)
    }
}
