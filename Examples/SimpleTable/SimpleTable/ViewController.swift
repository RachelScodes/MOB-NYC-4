//
//  ViewController.swift
//  SimpleTable
//
//  Created by William Martin on 10/19/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The items we're going to show in the table. They are Strings here, but normally we'd have
    // instances of a class we've written and some behaviors for creating new ones, deleting them,
    // and so on.
    let noteTitles = [
        "General Assembly notes",
        "Swift 2.0 updates",
        "Table view stuff"
    ]
    
    // From the UITableViewDataSource protocol, we're required to return the number of rows
    // that will show up in the only section in the table.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noteTitles.count
    }
    
    // Return an instance of UITableViewCell that should populate this row.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // The table we've placed into the ViewController should have a single "Dynamic Prototype"
        // and its identifier should be set to "note_cell.
        //
        // This enables us to cache cell instances for faster performance. So we never have more 
        // instances of UITableViewCell than there are visible cells in the view.
        // 
        // This grabs the next cell with the given identifier, enabling us to have multiple types
        // of cells displayed in a single table, but primarily leveraging this caching behavior.
        let cell = tableView.dequeueReusableCellWithIdentifier("note_cell", forIndexPath: indexPath)
        
        // Get the title to show in the row by getting which row from the NSIndexPath provided
        // by the function call.
        let title = self.noteTitles[indexPath.row]
        
        // Set the text in the label...
        cell.textLabel?.text = title
        
        // And return the UITableViewCell instance.
        return cell
    }
    
}

