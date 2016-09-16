//
//  File.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-17.
//  Copyright © 2016 TSTL. All rights reserved.
//

import Foundation
import UIKit

class slidingTab1: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

