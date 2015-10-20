//
//  NoteViewController.swift
//  NotesApp0
//
//  Created by William Martin on 10/19/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// This UIViewController is responsible for editing a single Note instance.
class NoteViewController: UIViewController {
    
    // The Note this View Controller is supposed to reference.
    var note : Note!
    
    // References to the two views in the View Controller.
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // When the view loads, we can take the values from the given Note and set their values
        // to the given Views. This displays the values to the user.
        
        self.titleField.text = self.note.title
        self.contentField.text = self.note.content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Just before the view disappears, we want to update the Note with the new values.
    override func viewWillDisappear(animated: Bool) {
        
        // Set the note title and content to values from the Views, since the user may have
        // updated the note's title and content.
        self.note.title = self.titleField.text!
        self.note.content = self.contentField.text!
        
    }


}
