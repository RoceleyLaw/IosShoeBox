//
//  SecondViewController.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-06-15.
//  Copyright © 2016 TSTL. All rights reserved.
//

import UIKit
import PageMenu


class SecondViewController: UIViewController, UIScrollViewDelegate{
    
    let kImageHeight:Float = 400
    let kInWindowHeight:Float = 200

    
    var pageMenu : CAPSPageMenu?
    
  
    
     var dataFull = NSMutableDictionary()
     var dataKey = NSMutableArray()
     var slideImgArray = NSMutableArray()
     var slideTtlArray = NSMutableArray()
     var slideArray = NSMutableArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        // Array to keep track of controllers in page menu
        
        //self.preferredStatusBarStyle() = UIStatusBar.Style.LightContent
        //self.title = "ShoeBox"
        self.navigationItem.title = "ShoeBox"
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Default
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<-", style: UIBarButtonItemStyle.Done, target: self, action: "didTapGoToLeft")
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "->", style: UIBarButtonItemStyle.Done, target: self, action: "didTapGoToRight")
        
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let controller1 : slidingTab1 = slidingTab1(nibName: "slidingTab1", bundle: nil)
        controller1.title = "最新消息"
        
        controllerArray.append(controller1)
        let controller2 : Slider2 = Slider2(nibName: "Slider2", bundle: nil)
        controller2.title = "热门点击"
        controllerArray.append(controller2)
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.whiteColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 18.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)    }
    
    
//    func didTapGoToLeft() {
//        let currentIndex = pageMenu!.currentPageIndex
//        
//        if currentIndex > 0 {
//            pageMenu!.moveToPage(currentIndex - 1)
//        }
//    }
//    
//    func didTapGoToRight() {
//        let currentIndex = pageMenu!.currentPageIndex
//        
//        if currentIndex < pageMenu!.controllerArray.count {
//            pageMenu!.moveToPage(currentIndex + 1)
//        }
//    }
    
    override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
        return true
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        // zero duration means no animation
        let duration:NSTimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        if frame != nil {
            UIView.animateWithDuration(duration) {
                self.tabBarController?.tabBar.frame = CGRectOffset(frame!, 0, offsetY!)
                return
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return self.tabBarController?.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame)
    }
    
    // Call the function from tap gesture recognizer added to your view (or button)
    
    @IBAction func tapped(sender: AnyObject) {
        setTabBarVisible(!tabBarIsVisible(), animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLogin"{
            print("showLogin seque called")
            let bottomBar = segue.destinationViewController as! SecondViewController
            bottomBar.hidesBottomBarWhenPushed = true
            bottomBar.navigationItem.hidesBackButton = true
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 点击的themeCell,美辑cell
        if tableView === DetailViewController() {
            //let theme = self.themes!.list![indexPath.row]
            //let themeVC = ThemeViewController()
            let themeVC = DetailViewController()
            //themeVC.themeModel = theme
            navigationController?.pushViewController(themeVC, animated: true)
            
        } else { // 点击的slider2TableView里的
            
            //let event = self.everyDays!.list![indexPath.section]
            if indexPath.row == 1 {
                //let themeVC = DetailViewController()
                //themeVC.themeModel = event.themes?.last
                //navigationController!.pushViewController(themeVC, animated: true)
                
//            } else { // 点击的美天的cell
//                let eventVC = EventViewController()
//                let event = self.everyDays!.list![indexPath.section]
//                eventVC.model = event.events![indexPath.row]
//                navigationController!.pushViewController(eventVC, animated: true)
            }
        }
    }

//    
//    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
//    {
//        if indexPath!.section==0 {return}
//        tableView.deselectRowAtIndexPath(indexPath!,animated: true)
//        let index = indexPath!.row
//        let array1 = self.dataFull[self.dataKey[(indexPath?.section)!-1] as! String] as! NSArray
//        let data = array1[index] as! NSDictionary
//        let detailCtrl = DetailViewController(nibName :"DetailViewController", bundle: nil)
//        detailCtrl.aid = data["id"] as! Int
//        self.navigationController!.pushViewController(detailCtrl, animated: true)
//    }
//
//    func SlideScrollViewDidClicked(index:Int)
//    {
//        if index == 0 {return} // when you click scrollview too soon after the view is presented
//        let data = self.slideArray[index-1] as! NSDictionary
//        let detailCtrl = DetailViewController(nibName :"DetailViewController", bundle: nil)
//        detailCtrl.aid = data["id"] as! Int
//        self.navigationController!.pushViewController(detailCtrl, animated: true)
//    }
//    
//    
//    
//    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
//        
//        var cell:UITableViewCell
//        if indexPath!.section==0{
//            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
//            cell.backgroundColor = UIColor.clearColor()
//            cell.contentView.backgroundColor = UIColor.clearColor()
//            cell.selectionStyle = UITableViewCellSelectionStyle.None
//            cell.clipsToBounds = true
//            
//            if self.slideImgArray.count > 0{
//                let width = UIScreen.mainScreen().bounds.size.height
//                let slideRect = CGRect(origin:CGPoint(x:0,y:0),size:CGSize(width:width,height:CGFloat(kImageHeight)))
//                
//                let slideView = scrollView(frame: slideRect)
//                slideView.delegate = self
//                slideView.initWithFrameRect(slideRect,imgArr:self.slideImgArray,titArr:self.slideTtlArray)
//                //                self.view.addSubview(slideView)
//                //                self.tableView.tableHeaderView = slideView
//                cell.addSubview(slideView)
//            }
//        }
//        else{
//            let c = tableView?.dequeueReusableCellWithIdentifier("Slider2Cell", forIndexPath: indexPath!) as? Slider2Cell
//            let index = indexPath!.row
//            let array1 = self.dataFull[self.dataKey[(indexPath?.section)!-1] as! String] as! NSArray
//            let data = array1[index] as! NSDictionary
//            c!.data = data
//            cell = c!
//        }
//        return cell
//    }
    
    
    


}

