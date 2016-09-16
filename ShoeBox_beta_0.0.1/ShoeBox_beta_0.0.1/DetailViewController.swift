//
//  DetailedViewController.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-24.
//  Copyright © 2016 TSTL. All rights reserved.
//


import UIKit
import CoreData
import SwiftyJSON

class DetailViewController: UIViewController,UIScrollViewDelegate {
    
    var url:(String) = String();
    
    var contentUrlArray:[String]! = ["http://www.nytimes.com/2016/07/03/sports/baseball/yankees-squander-ivan-novas-solid-start-as-padres-win-in-walk-off.html"]
    

    @IBOutlet var webView: UIWebView!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.webView!.scrollView.delegate = self
        navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        //loadData()
        //let url = "http://www.nytimes.com/2016/07/03/sports/baseball/yankees-squander-ivan-novas-solid-start-as-padres-win-in-walk-off.html"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        //addDummyData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}











