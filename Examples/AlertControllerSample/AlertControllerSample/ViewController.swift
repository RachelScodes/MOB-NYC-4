//
//  ViewController.swift
//  AlertControllerSample
//
//  Created by trvslhlt on 9/16/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert(sender: UIButton) {
        let alert = UIAlertController(title: "Alert!", message: "congrats", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "ok thanks", style: UIAlertActionStyle.Default, handler: nil)
        [action].map{ alert.addAction($0) }
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet(sender: UIButton) {
        let actionSheet = UIAlertController(title: "Action Sheet", message: "congrats", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let action1 = UIAlertAction(title: "action1", style: UIAlertActionStyle.Default, handler: nil)
        let action2 = UIAlertAction(title: "action2", style: UIAlertActionStyle.Destructive, handler: nil)
        [action1, action2].map{ actionSheet.addAction($0) }
        presentViewController(actionSheet, animated: true, completion: nil)
    }

}

