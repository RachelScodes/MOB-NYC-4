//
//  ModalViewController.swift
//  DismissModal
//
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    // Reference to the main ViewController instance.
    var mainViewController : ViewController!
    
    // Reference to the text field that we can edit in this view controller.
    @IBOutlet weak var myTextField: UITextField!

    // Action called when a user taps the "Dismiss" button.
    @IBAction func onDismissTapped(sender: AnyObject) {
        // Get the text from the text field.
        let newLabelText = self.myTextField.text

        // Use our reference to the main ViewController instance to set its label.
        self.mainViewController.myLabel.text = newLabelText
        
        // Dismisses this modal view controller.
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
