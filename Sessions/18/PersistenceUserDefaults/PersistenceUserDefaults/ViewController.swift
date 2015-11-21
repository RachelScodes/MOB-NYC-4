//
//  ViewController.swift
//  PersistenceUserDefaults
//
//  Created by William Martin on 6/8/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit


/* 
This example shows you how to use NSUserDefaults to save single values in its
key-value store. Use this for small bits of data that can be contained as simple
data types, like Doubles, Booleans, Strings, etc.

This is normally used to store user preferences, small bits of app state (like whether
this is the first time the app has been run), etc.

An advantage of NSUserDefaults it that it's available anywhere in the app through the
singleton, NSUserDefaults.standardUserDefaults()

NSUserDefaults is implemented as a property list, so what you get is a convenient
wrapper for a propery list that's used to store default values and preferences and is
accessible everywhere in the app without explicitly loading the file.
*/

class ViewController: UIViewController, UITextViewDelegate {
    // Load the NSUserDefaults singleton for reference throughout this class.
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBAction func onSaveTapped(sender: AnyObject) {
        let text = self.myTextView.text
        
        // Save the text entered by the user under a key of our choosing, in this case, userText.
        // Think of this as a short welcome message or reminder the user would want to
        // see when opening the app.
        self.defaultsMgr.setValue(text, forKey: "userText")
        
        // Other methods include:
        // self.defaultsMgr.setNilValueForKey(String)
        
        // self.defaultsMgr.setBool(Bool, forKey: String)
        
        // self.defaultsMgr.setDouble(Double, forKey: String)
        // self.defaultsMgr.setFloat(Float, forKey: String)
        // self.defaultsMgr.setInteger(Int, forKey: String)
        
        // self.defaultsMgr.setURL(NSURL?, forKey: String)
        // self.defaultsMgr.setObject(AnyObject?, forKey: String)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the saved text from NSUserDefaults under the key "userText".
        if let savedText = self.defaultsMgr.valueForKey("userText") as? String {
            
            // Display the text in the text view just so we can see it.
            self.myTextView.text = savedText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

