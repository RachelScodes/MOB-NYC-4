//
//  ViewController.swift
//  Assessment5
//
//  Created by trvslhlt on 11/14/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    let postService: PostServiceProtocol = RedditService()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshPosts", forControlEvents: .ValueChanged)
        return refreshControl
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        tableView.addSubview(refreshControl)
        refreshPosts()
    }
    
    //MARK: PostService
    func refreshPosts() {
        postService.getPosts { (posts, error) -> () in
            self.refreshControl.endRefreshing()
            if let _ = error {
                self.displayFailureToGetPosts()
            } else if let p = posts {
                self.posts = p
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier where segueIdentifier == "postSelected" {
            let postDetailViewController = segue.destinationViewController as! PostDetailViewController
            postDetailViewController.post = posts[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = "\(post.score)"
        return cell
    }
    
    //MARK: Error Handling
    func displayFailureToGetPosts() {
        let alertController = UIAlertController(
            title: "Drat!",
            message: "Posts were not to be got. Pull down on the table to try again.",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

