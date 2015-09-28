//
//  ViewController.swift
//  DismissModal
//
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modal_segue" {
            // Get a reference to the view controller we're going to.
            let target = segue.destinationViewController as! ModalViewController
            
            // Set its mainViewController property to this ViewController instance,
            // so it has access to its properties and methods.
            target.mainViewController = self
        }
    }

}

