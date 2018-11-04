//
//  TagCollectionViewCell.swift
//  TagStyleCollectionViewDemo
//
//  Created by brockk on 11/4/18.
//  Copyright © 2018 Sarthak. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var maxWidthContraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = tagViewBackgroundColor
        self.lblTitle.textColor = tagTitleDefaultColor
        
        self.layer.cornerRadius = tagViewCornerRadius
        self.layer.borderColor = tagViewBorderColor.cgColor
        self.layer.borderWidth = tagViewBorderWidth
            
        // maximum width constraint, this value should be screen width, minus margin of cell, minus internal padding of cell, which 8pt:
        self.maxWidthContraint.constant = UIScreen.main.bounds.width - horizontalSpacing * 2 - horizontalSpacing * 2
    }
}
