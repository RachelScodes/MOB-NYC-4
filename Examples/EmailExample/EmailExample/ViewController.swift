//
//  ViewController.swift
//  EmailExample
//
//  Created by William Martin on 12/9/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// Make sure to import the MessageUI framework into your project.
// Project options -> current app target -> General tab -> Linked Frameworks and Libraries
import MessageUI

class ViewController: UIViewController,
    MFMailComposeViewControllerDelegate
{
    
    var emailer : MFMailComposeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSendClick(sender: UIButton) {
        emailer = MFMailComposeViewController()
        emailer.mailComposeDelegate = self
        
        let recipients = ["awmartin@gmail.com"]
        emailer.setToRecipients(recipients)
        
        emailer.setMessageBody("Hello there!", isHTML: false)
        
        // Show the email view controller with this.
        self.presentViewController(emailer, animated: true, completion: nil)
    }
    
    // This protocol method is called when the user is done.
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        // Dismiss the email view controller.
        emailer.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

