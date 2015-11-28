//
//  ViewController.swift
//  PersistenceFlatFiles
//
//  Created by William Martin on 6/8/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

/*
This example shows you how to write a simple file in iOS.

Flat files are the most general way to save data to device, in a file system very similar to your
Mac's file system. Each app has its own isolated directory structure of a few folders, one of 
which is called "Documents," where you should do most of your storing of persistent files.

These files can be plain text, images, music, etc. You can create as many of these files as you
need, like PDF downloads for a PDF reader app, etc. This can start to use up a user's iPhone 
storage space, so be sensitive to that and the kinds of data you're saving.

Note that like property lists, you don't have to load/save a file each time you need the data;
you can keep it in memory inside your data model. However, this can start to use up the iPhone's
RAM, so be prepared to dump that in-memory data and re-read from the file system when the data
is needed again. (This is what didReceiveMemoryWarning is for in the UIViewController).
*/

class ViewController: UIViewController {
    
    // This is a computed property. It gets a URL that refers to the app's "Documents" directory.
    // Access it using self.documentsDirectory.
    lazy var documentsDirectory: NSURL = {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!
    }()
    
    // This method takes a file name like "essay.txt", and returns an NSURL that points to it.
    // You can use that NSURL in various methods to refer to the file, load it, save data to it, etc.
    func getUrlForDocument(documentName: String) -> NSURL {
        return self.documentsDirectory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func onSaveTapped(sender: AnyObject) {
        // Get an NSURL that points to a file of the given name.
        let textFile = "myText.txt"
        let textFileUrl = self.getUrlForDocument(textFile)
        
        // Grab the text and save it to the given file.
        //
        // Note that we're using an NSString type instead of a regular Swift String. This has the
        // proper methods for saving to disk.
        
        let textToSave: NSString = self.textView.text
        
        // Also note that this method, writeToURL, throws an error. So we have to use the
        // exception-handling routing do-try-catch blocks to catch the error.
        do {
            try textToSave.writeToURL(textFileUrl, atomically: true, encoding: NSUTF8StringEncoding)
            
        } catch {
            // This clause here is like the "else" clause of an if-else statement.
            // If the statement after "try" above throws an exception, this clause is executed 
            // instead of the remainder of the "do" clause.
            print("An exception occurred when saving the file!")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get an NSURL that points to a file of the given name.
        let textFile = "myText.txt"
        let textFileUrl = self.getUrlForDocument(textFile)
        
        // We have to use do-try-catch here as well. If you try to auto-complete the constructor
        // NSString(contentsOfUrl..., in the dropdown menu, it ends with "throws," which indicates
        // that this do-try-catch paradigm is required.
        // 
        // Note that location of "try", which is placed before the initializer that can throw an
        // exception.
        do {
            // This reads the contents of the given URL.
            let textFromFile = try NSString(contentsOfURL: textFileUrl, encoding: NSUTF8StringEncoding)
            
            // Display the text in the text view once it's read from the file.
            self.textView.text = textFromFile as String
            
        } catch {
            // Oops, an exception was thrown. Now we need to do something that handles the error
            // in a graceful way.
            print("The file couldn't be read. Maybe this is the first time you're running the app?")
            
            self.textView.text = "Hello! Save me!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

