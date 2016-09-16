//
//  tableForFirstPage.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-15.
//  Copyright © 2016 TSTL. All rights reserved.
//
import UIKit
import CoreData
import SwiftyJSON
//typealias ServiceResponse = (JSON, NSError?) -> Void

class tableForFirstPage: UITableViewController, UISearchBarDelegate, NSFetchedResultsControllerDelegate{
    //var colors:[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor()]
    
    
    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    
    @IBOutlet var page: UIPageControl!
    
    @IBOutlet var titleLabel: UILabel!
    
    //let refreshController: UIRefreshControl = UIRefreshControl()
    
    var pictures:[UIImage] = [UIImage(named:"woman1.jpg")!,UIImage(named:"woman2.jpg")!,UIImage(named:"woman3.jpg")!,UIImage(named:"woman1.jpg")!]
//    pictures.append(UIImage.init(named: "woman1.jpg")!)
//    pictures.append(UIImage.init(named: "woman2.jpg")!)
//    pictures.append(UIImage.init(named: "woman3.jpg")!)
//    pictures.append(UIImage.init(named: "woman2.jpg")!)
    var frame: CGRect = CGRectMake(0, 0, 0, 0)

    @IBOutlet var scrollView: UIScrollView!
    @IBAction func searchButton(sender: AnyObject) {
        createSearchBar()
    }
    var name = [String]();
    var index = 0;
    
    override func viewDidLoad() {
        //name = ["allusion","safe","mentalism"]
        
        getRandomUser{ (json: JSON) in
            if let results = json["results"].array{
                for entry in results {
                    //print(entry["title"].stringValue)
                    
                    self.name.append(entry["title"].stringValue)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView.reloadData()
                })
            }
            }
        
        
       
            
            //(json: JSON) in
//            if let results = json["results"].array {
//                for entry in results {
//                    self.name.append(json: entry["title"]);
//                }
//                dispatch_async(dispatch_get_main_queue(),{
//                    self.tableView.reloadData()
//                }
        
        //print(self.name)
                    
                    
        scrollView.delegate = self
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
            page.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
            
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(pictures.count), self.scrollView.frame.size.height)
        
        //PageController
        
        self.page = UIPageControl(frame:CGRectMake(160, 227, 39, 37))
        
        configurePageControll()
        
        //refreshController.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
               //self.tableView.addSubview(self.refreshController) // not required when using UITableViewController
        
        //        self.table.reloadData()
        //        refreshControl.endRefreshing()
        //print(name)
        
        self.addToPullToRefresh()

        
        
    }
    
    
    func addToPullToRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self.tableView, action:#selector(tableForFirstPage.refresh), forControlEvents: UIControlEvents.ValueChanged)
        print(name)
        self.tableView.addSubview(refreshControl)
    }
    
    
    func refresh()
    {   let newName = "HIHIHIHIHI"
        name.append(newName)
        
        print("hihih hihiiiiiiiiiiiiiiiii")
        self.tableView.reloadData()
        refreshControl!.endRefreshing()    }


    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.scrollView.frame = CGRect(x: 0.0, y: 100.0, width: 200.0, height: 200.0)
//    }

//    func getJSON(){
//        let url = NSURL(string:"https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=b6947c50262a40019d0420f8ffef676c")
//        
//        let request = NSURLRequest(URL:url!)
//        
//        //equest.HTTPMethod = "GET"
//        
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//        let task = session.dataTaskWithRequest(request,completionHandler: {(data,response ,error) -> Void in
//            if error == nil{
//                
//                
//                let swiftyJSON = JSON(data:data!)
//                let theTitle = swiftyJSON["results"].arrayValue
//                //print(theTitle)
//                
//                for title in theTitle{
//                    
//                   let titles = title["title"].stringValue
//                    
//                    self.name.append(titles)
//                    
//                    
//                }
    
    
//               //print(self.name)
//                
//            }else{
//            
//                print("error!")
//            }
//        
//            //print(self.name)
//
//            
//        })
//    
//        //after resume been called, data disappear???
//        task.resume()
//        print(self.name)
//        
//        
//    
//    
//    }
    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        let route = "https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=b6947c50262a40019d0420f8ffef676c"
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    
    private func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                onCompletion(json, error)
            } else {
                onCompletion(nil, error)
            }
        })
        task.resume()
    }
    
    
    // MARK: Perform a POST Request
//    private func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: ServiceResponse) {
//        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
//        
//        // Set the method to POST
//        request.HTTPMethod = "POST"
//        
//        do {
//            // Set the POST body for the request
//            let jsonBody = try NSJSONSerialization.dataWithJSONObject(body, options: .PrettyPrinted)
//            request.HTTPBody = jsonBody
//            let session = NSURLSession.sharedSession()
//            
//            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//                if let jsonData = data {
//                    let json:JSON = JSON(data: jsonData)
//                    onCompletion(json, nil)
//                } else {
//                    onCompletion(nil, error)
//                }
//            })
//            task.resume()
//        } catch {
//            // Create your personal error
//            onCompletion(nil, nil)
//        }
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableCell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
        
        tableCell.textLabel!.text = name[indexPath.row]
        //print(name)
        
        //addToPullToRefresh()

        
        return tableCell
        
    }
    
    func createSearchBar(){
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Enter your search here!"
        searchBar.delegate = self
        
        //self.navigationController!.navigationBar.translucent = true;
        self.navigationItem.titleView = searchBar
    }
    
    func configurePageControll(){
        self.page.numberOfPages = pictures.count
        self.page.currentPage = 0
        self.page.currentPageIndicatorTintColor = UIColor.whiteColor()
        self.view.addSubview(page)
        
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(page.currentPage) * scrollView.frame.size.width
        
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        page.currentPage = Int(pageNumber)
    }

    
    


    
}
