//
//  Slider2.swift
//  testFrameWork
//
//  Created by LawRoceley on 2016-06-17.
//  Copyright © 2016 TSTL. All rights reserved.
//


import Foundation
import UIKit
import SwiftyJSON

class Slider2: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    
    @IBOutlet var page: UIPageControl!
    var dataArray = NSMutableArray()

    @IBOutlet var scrollView: UIScrollView!
    //set color as background
    //var colors:[UIColor] = [UIColor.init(patternImage: UIImage(imageLiteral: "1")),UIColor.init(patternImage: UIImage(imageLiteral: "2")),UIColor.init(patternImage: UIImage(imageLiteral: "3")),UIColor.init(patternImage: UIImage(imageLiteral: "4"))]
    //set photo as background
    //var colors:[UIColor] = [UIColor.init(patternImage: UIImage(imageLiteral: "woman1.jpg")),UIColor.init(patternImage: UIImage(imageLiteral: "2")),UIColor.init(patternImage: UIImage(imageLiteral: "3")),UIColor.init(patternImage: UIImage(imageLiteral: "4"))]
    
    var pictures:[UIImage] = [UIImage(named:"7")!,UIImage(named:"1")!,UIImage(named:"7")!,UIImage(named:"1")!]

    
     //var colors:[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor()]
    var frame: CGRect = CGRectMake(0, 0, 0, 0)

    @IBOutlet var hh: UIView!
    @IBOutlet var table: UITableView!
    var namesArray:[postObject]! = [postObject(json: "aaa")];
    //var namesArray : [String] = ["Nike x Rihanna", "Sneaker vs. Heals", "3","3","3","3"]
//    var image0 = UIImage.init(named: "1")
//    var image1 = UIImage.init(named: "2")
//    var image2 = UIImage.init(named: "3")
    var photoNameArray:[String] = ["woman1.jpg","woman2.jpg","woman3.jpg","woman3.jpg","woman3.jpg","woman3.jpg"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        table.delegate = self
        table.dataSource = self
  
        self.table.registerNib(UINib(nibName: "Slider2Cell", bundle: nil), forCellReuseIdentifier: "Slider2Cell")
        
            //table cells can not shown as expected
        //for here the id is cell rather than real id, but why>>?????
        self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.table.rowHeight = 100.0

        
//        photoNameArray = NSMutableArray.init();
//        photoNameArray.insert(image0, atIndex: 0);
        
        //necessary
        scrollView.delegate = self
        //scrollview
        for index in 0..<pictures.count{
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            //frame.origin.y = self.scrollView.frame.size.height/3
            frame.size = self.scrollView.frame.size
            
            //frame.size = CGSize(0,50,50)
            self.scrollView.pagingEnabled = true
            
            var subview = UIImageView(frame: frame)
            //var subView = UIView(frame:frame)
            //subView.backgroundColor = colors[index]
            subview.image = pictures[index]
            subview.contentMode = .ScaleAspectFill
            self.scrollView.addSubview(subview)
            
            
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(pictures.count), self.scrollView.frame.size.height)
        //self.scrollView.frame.size.height
        
//        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(colors.count), self.scrollView.frame.size.height)
        
        
        //PageController
        
        self.page = UIPageControl(frame:CGRectMake(self.view.frame.width/3,self.scrollView.frame.size.height - 25,39,37))
        
        print(self.scrollView.frame.size.height)
        
        configurePageControll()
        scrollViewDidEndDecelerating(scrollView)
        page.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
    
        
        
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.namesArray.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        var cell = UITableViewCell()
//        cell.textLabel!.text = "haha"
        let cell : Slider2Cell = tableView.dequeueReusableCellWithIdentifier("Slider2Cell") as! Slider2Cell
        
        // Configure the cell...
        cell.nameLabel.text = namesArray[indexPath.row].title
        
        
        
        //if(photoNameArray.count < namesArray.count){
            
            //cell.photoImageView.image = UIImage(named: photoNameArray[indexPath.row])
            
//            for _ in 0..<namesArray.count{
//                //cell.photoImageView.image = UIImage(named: photoNameArray[0])
//                let url = namesArray[indexPath.row].pictureURL
//                let requestURL = NSURL(string:url)
//                let request = NSURLRequest(URL: requestURL!)
//                cell.webView.loadRequest(request)
//            }
        //}else{
        
            //cell.photoImageView.image = UIImage(named: photoNameArray[indexPath.row])
            
        let url = namesArray[indexPath.row].pictureURL
        //print(url)
        let requestURL = NSURL(string:url)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(requestURL!){
        (data,response,error) -> Void in
            if error != nil{
                print(error)
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    void in
                    
                    if let thumbNail = UIImage(data:data!){
                        //photoNameArray.append(thumbNail.images)
                        cell.photoImageView.image = thumbNail

                }})
            }}
        
        task.resume()
        return cell
        }
    

       // }
        
            //cell.webView = namesArray[indexPath.row].pictureURL
        
//
    
    
//
 func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    //when cell(row) is seleted, push ViewController DetailedViewController
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //let index = indexPath.row
        //let data = self.namesArray[index] as! NSDictionary
        let newsArtcleView = DetailViewController(nibName :"DetailViewController", bundle: nil)
        //commentsVC.jokeId = data.stringAttributeForKey("id")'
//        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.whiteColor();
        self.navigationController!.pushViewController(newsArtcleView, animated: true)
        
        //link url
        newsArtcleView.url = self.namesArray[indexPath.row].contentURL
    }
    
    
    
    
    func configurePageControll(){
        self.page.numberOfPages = pictures.count
        self.page.currentPage = 0
        self.page.pageIndicatorTintColor = UIColor.whiteColor()
        self.page.currentPageIndicatorTintColor = UIColor.orangeColor()
        self.view.addSubview(page)
        
        
        //self.page.tintColor = UIColor.redColor()
        
        //self.page.currentPageIndicatorTintColor = UIColor.greenColor()
        //self.view.addSubview(page)
    
    }
    
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(page.currentPage) * scrollView.frame.size.width
        
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        page.currentPage = Int(pageNumber)
    }
    
    
    func addDummyData() {
        RestApiManager.sharedInstance.getRandomUser { (json:JSON) in
            if let results = json["results"].array {
                for entry in results {
                    self.namesArray.append(postObject(json: entry))
                    //print(self.namesArray)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.table.reloadData()
                })
            }
        }
    }

//
}

