//
//  ViewController.swift
//  Reader
//
//  Created by William Martin on 11/9/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var responseView: UITextView!

    @IBAction func onGetTapped(sender: UIButton) {
        func onCompletion(data:NSData?, response:NSURLResponse?, error:NSError?) {
            let stringOfData = NSString(data: data!, encoding: NSUTF8StringEncoding)!

            dispatch_async(dispatch_get_main_queue()) {
                self.responseView.text = String(stringOfData)
            }
        }
        
        if let url = NSURL(string: "https://reddit.com/.json") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: onCompletion)
            task.resume()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

