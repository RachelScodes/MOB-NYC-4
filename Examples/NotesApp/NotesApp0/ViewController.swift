//
//  ViewController.swift
//  NotesApp0
//
//  Created by William Martin on 10/19/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// Note that ViewController is conforming to the UITableViewDataSource protocol, which means
// it is:
//
// 1. bound to provide numberOfRowsInSection and cellForRowAtIndexPath
// 2. capable of serving as a .dataSource delegate object for a UITableView.
//
class ViewController: UIViewController, UITableViewDataSource {
    
    // Get an IBOutlet to the table view because we'll need it in prepareForSegue.
    @IBOutlet weak var notesList: UITableView!

    
    // ------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: - Rendering
    
    // Ensure that when the view controller appears, the table is re-rendered.
    override func viewWillAppear(animated: Bool) {
        self.notesList.reloadData()
    }

    // ------------------------------------------------------------------------------------------
    // MARK: - Table view methods
    
    // From UITableViewDataSource, just return the number of notes in the note manager.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteManager.singleton.numberOfNotes()
    }
    
    // Also from UITableViewDataSource, return an instance of UITableViewCell that should be
    // rendered at the location we're given (indexPath, which includes .section and .row properties).
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Ask the table to give us a cell.
        let cell = tableView.dequeueReusableCellWithIdentifier("note_cell", forIndexPath: indexPath)
        
        // Get the note from the NoteManager.
        let note = NoteManager.singleton.getNote(indexPath.row)
        
        // Set the properties on the UITableViewCell to render the data to the user.
        //
        // UITableViewCells have the properties .textLabel and .detailTextLabel provided and 
        // properly populated if we use a style provided, which we are, the "Subtitle" style
        // selected in Interface Builder when we have the table cell prototype selected.
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.getExcerpt() + "..."
        
        // Return the UITableViewCell instance to the table.
        return cell
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get a reference to the NoteViewController we're going to.
        let noteVC = segue.destinationViewController as! NoteViewController
        
        if segue.identifier == "create_note" {
            
            // Create a new note using the NoteManager.
            let newNote = NoteManager.singleton.createNote("Untilted")
            
            // Now, hand the note over to the NoteViewController for editing.
            noteVC.note = newNote
            
            
        } else if segue.identifier == "edit_note" {
            
            // Here, we're supposed to edit a note, but we don't have an indexPath to tell us
            // which note we're editing. So we have to do some trickery to find out.
            
            // First, the "sender" argument is the object that initiated the segue. Since the
            // only way we can get to the "edit_note" segue is by tapping on a table cell, we're
            // fairly confident we can force-cast this argument to a UITableViewCell.
            let cell = sender as! UITableViewCell
            // Note: We should probably use as? and test for nil using if-let.
            
            // Given a cell, we can use a reference to the table itself to get the indexPath 
            // that points to that cell. It's also optional (since we might be giving the method
            // a bogus cell), but we're also fairly confident we're giving it a real cell.
            let indexPath = self.notesList.indexPathForCell(cell)!
            
            // Note we can use .row to get the note we want to render...
            let note = NoteManager.singleton.getNote(indexPath.row)
            
            // ... and hand it to the NoteViewController for editing.
            noteVC.note = note
            
        }
    }
    

}
























