//
//  FoodCollectionView.swift
//  FoodBusters
//
//  Created by Mihriban Minaz on 05/07/15.
//  Copyright (c) 2015 Mihriban Minaz. All rights reserved.
//

import UIKit

class FoodCollectionView : UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bgView : UIView = UIView(frame: self.bounds)
        bgView.backgroundColor = UIColor.clearColor()
        self.backgroundView = bgView
        
        
        let selectedBGView : UIView = UIView(frame: self.bounds)
        selectedBGView.backgroundColor = UIColor.whiteColor()
        self.selectedBackgroundView = selectedBGView
    }
    
}