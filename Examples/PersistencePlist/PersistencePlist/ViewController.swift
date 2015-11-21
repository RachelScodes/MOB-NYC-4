//
//  ViewController.swift
//  PersistencePlist
//
//  Created by William Martin on 6/8/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

/*
This example demonstrates saving data in a Property List file (.plist), which acts as a store
for Swift data types and structures (arrays and dictionaries). Xcode includes an editor that 
makes editing plist files easier.

Property list files are saved using the same technique we'll use for saving flat files, but
interacting with them is a little different, since with a flat file, we'd have to parse the data
included inside them manually (unless they're just images or plain text files). With property
list files, we get a nice Swift data structure that we can use normally without any additional
work.

Be careful when using properly list files. You don't have to load the file every time you need
a value. One strategy is to load the plist file when the app opens and then store it in your 
data model (in a singleton), and then when the app closes or goes to the background, save it
again to the file system.
*/

class ViewController: UIViewController {
    
    // This is a computed property. It gets a URL that refers to the app's "Documents" directory.
    // Access it using self.documentsDirectory.
    lazy var documentsDirectory: NSURL = {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!
    }()
    
    // This one gets a URL directly to the propery list file we're creating.
    // Access this using self.propertyListUrl whenever you're asked for an NSURL that refers
    // to the property list file.
    lazy var propertyListUrl: NSURL = {
        return self.documentsDirectory.URLByAppendingPathComponent("myPropertyList.plist", isDirectory: false)
    }()
    
    @IBAction func onSaveTapped(sender: AnyObject) {
        // NOTE: - When you're tapping "save" in the app, remember to write a small bit of text in
        // the text field, otherwise you'll end up saving the text version of the Dictionary
        // below over and over:
        
        // Create a Dictionary of values that we want to save as a property list.
        let personalData : NSDictionary = [
            "bio": self.textView.text,
            "favorite_numbers": [3.14, 2.718, 1.618],
            "dog": [
                "name" : "Toshi",
                "species" : "canis lupus familiaris",
                "breed" : "Shiba Inu",
                "age" : 3
            ]
        ]
        
        // Use the NSDictionary method to write the property list to the file system.
        personalData.writeToURL(self.propertyListUrl, atomically: true)
    }
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the same type, NSDictionary, to load the property list from the file system.
        let personalData = NSDictionary(contentsOfURL: self.propertyListUrl)
        
        // Just show the contents of the Dictionary in the text view.
        self.textView.text = "\(personalData)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

