//
//  EisenhowerMatrixViewController.swift
//  Assessment3
//
//  Created by trvslhlt on 10/17/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class EisenhowerMatrixViewController: UIViewController {

    @IBOutlet weak var urgentImportantTextView: UITextView!
    @IBOutlet weak var notUrgentImportantTextView: UITextView!
    @IBOutlet weak var urgentNotImportantTextView: UITextView!
    @IBOutlet weak var notUrgentNotImportantTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMatrix()
    }
    
    func updateMatrix() {
        for task in TaskManager.sharedInstance.tasks {
            switch (task.isUrgent, task.isComplete) {
            case (true, true): urgentImportantTextView.text = urgentImportantTextView.text + "\(task.title)\n"
            case (false, true): notUrgentImportantTextView.text = notUrgentImportantTextView.text + "\(task.title)\n"
            case (true, false): urgentNotImportantTextView.text = urgentNotImportantTextView.text + "\(task.title)\n"
            case (false, false): notUrgentNotImportantTextView.text = notUrgentNotImportantTextView.text + "\(task.title)\n"
            }
        }
    }
    
    @IBAction func dismissTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true) {}
    }
    
}
