//
//  Slider2Cell.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-18.
//  Copyright © 2016 TSTL. All rights reserved.
//

import Foundation
import UIKit


//
//  FriendTableViewCell.swift
//  NFTopMenuController
//
//  Created by Niklas Fahl on 12/17/14.
//  Copyright (c) 2014 Niklas Fahl. All rights reserved.
//

import UIKit

class Slider2Cell: UITableViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var webView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //UITableViewCell.intMake(self.contentView.bounds.size.width/2,self.contentView.bounds.size.height/2)
        //photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        //photoImageView.center = self.center;
        let cellHeight:CGFloat = 100
        //self.photoImageView.frame = CGRectMake(0, 0, 125, 125)
        //self.photoImageView.center = CGPoint(x: self.center.x, y: cellHeight / 2)
        //self.photoImageView.image = Common.school_crest_image
        //self.imageLogo.contentMode = UIViewContentMode.ScaleAspectFit
       // self.addSubview(self.photoImageView)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
