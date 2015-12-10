//
//  CellViewController.swift
//  CollectionViewExperiment
//
//  Created by William Martin on 12/7/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// The view controller we segue to when the user taps on a CollectionViewCell.
class CellViewController: UIViewController {

    // The data we're going to show.
    var wordToShow : String!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the word in the UILabel we've set up.
        self.textLabel.text = self.wordToShow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
