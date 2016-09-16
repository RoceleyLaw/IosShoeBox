//
//  favourites_directories.swift
//  ShoeBox_beta_0.0.1
//
//  Created by LawRoceley on 2016-09-15.
//  Copyright © 2016 TSTL. All rights reserved.
//

import Foundation
class favourites_directorie:UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    var namesArray : [String] = ["Nike x Rihanna", "Sneaker vs. Heals", "3","3","3","3"]


    override func viewDidLoad() {
        super.viewDidLoad()
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
        
       
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell!
        
        // Fetches the appropriate meal for the data source layout.
         cell.textLabel?.text =  namesArray[indexPath.row]
        
        //cell.namesLabel.text = cell.name
        
        return cell
    }
    
    
   
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let newsArtcleView = DetailViewController(nibName :"DetailViewController", bundle: nil)
        self.navigationController!.pushViewController(newsArtcleView, animated: true)
        
        
    }
    
    


}