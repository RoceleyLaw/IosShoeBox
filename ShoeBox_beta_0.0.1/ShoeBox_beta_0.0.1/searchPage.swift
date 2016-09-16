//
//  searchPage.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-16.
//  Copyright © 2016 TSTL. All rights reserved.
//

import Foundation
import UIKit

class searchPage: UIViewController,UISearchBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("come on!")
        createSearchBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSearchBar(){
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Enter your search here!"
        searchBar.delegate = self
        
        //self.navigationController!.navigationBar.translucent = true;
        self.navigationItem.titleView = searchBar
    }

}