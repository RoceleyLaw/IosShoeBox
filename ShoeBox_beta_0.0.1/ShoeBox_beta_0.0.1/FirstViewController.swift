//
//  FirstViewController.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-15.
//  Copyright © 2016 TSTL. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

        @IBOutlet var barButtonOpen: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        // Do any additional setup after loading the view, typically from a nib.
        barButtonOpen.target = self.revealViewController()
        barButtonOpen.action = #selector(SWRevealViewController.revealToggle(_:))
            
//        open.targetForAction(Selector("revealToggle:"), withSender: self.revealViewController())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

