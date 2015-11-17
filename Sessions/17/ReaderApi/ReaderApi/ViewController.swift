//
//  ViewController.swift
//  ReaderApi
//
//  Created by William Martin on 11/16/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://reddit.com/.json"
        
        // Get the shared NSURLSession object provided by that class.
        let session = NSURLSession.sharedSession()
        
        // We need an NSURL instance to use .dataTaskWithURL, but the NSURL
        // initializer that accepts a String will return an Optional value.
        // So use `if let` to ensure that we have a proper NSURL instance.
        if let _url = NSURL(string: url) {
            // Create a "task" object that handles our network request.
            let task = session.dataTaskWithURL(_url, completionHandler: self.onComplete)
            
            // It's a strange method name, but .resume() is the method 
            // that begins the network request.
            task.resume()
        }
    }
    
    var titles : [String] = []
    
    func onComplete(data:NSData?, response:NSURLResponse?, error:NSError?) {
        // Parse the JSON data.
        let json = JSON(data:data!)
        
        // Get all the posts in the Reddit JSON.
        // Since the "children" key-value pair contains an list, we can use
        // .array! to convert it into a Swift Array.
        let articles = json["data"]["children"].array!
        
        // Iterate over all the articles in the JSON.
        for article in articles {
            // Extract the title from this article.
            let title = article["data"]["title"].string!
            
            // Add it to our list of titles that we want to display.
            self.titles.append(title)
        }
        
        // Update the UI on the main thread.
        dispatch_async(dispatch_get_main_queue()) {
            // Tell the table view that it needs to re-render
            // all the cells, all the data.
            self.articleTable.reloadData()
        }
        
    }
    
    // This outlet refers to our UITableView in the storyboard.
    // Make sure you have a table view added with the proper
    // Auto Layout constraints.
    @IBOutlet weak var articleTable: UITableView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View required methods (from the UITableViewDataSource protocol)
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // The number of rows should equal the number of titles we have.
        return self.titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Ask the table view for a recycled cell we can re-use.
        let cell = tableView.dequeueReusableCellWithIdentifier("article_cell", forIndexPath: indexPath)
        
        // Grab the title for this cell.
        let title = self.titles[indexPath.row]
        
        // Set the text label available from the Basic style.
        cell.textLabel?.text = title
        
        return cell
    }
}









