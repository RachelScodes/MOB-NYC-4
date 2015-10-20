//
//  NotesDataModel.swift
//  NotesApp0
//
//  Created by William Martin on 10/19/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import Foundation


// A single manager class that will contain all the Notes the user creates and stores them
// for access anywhere in the app.
class NoteManager {
    
    // The Array of Notes that constitutes the user data for this app.
    var notes : [Note] = []
    
    // Given a particular index, return the Note at that index.
    //
    // We use a method here instead of just the raw property because we might want to do some
    // extra error checking on the bounds of the Note. Maybe we want to return nil (if the return
    // type were Note?) or cause an error message to be logged or displayed to the user.
    func getNote(index:Int) -> Note {
        return self.notes[index]
    }
    
    // Convenience method for creating a new Note and storing it automatically in the manager.
    func createNote(title:String) -> Note {
        // Create the note, given a title (String).
        let newNote = Note(title:title)
        
        // Store the note in the Array of Notes property we have created above.
        self.notes.append(newNote)
        
        // Return it to the caller, so it can use the note, give it to a View Controller, etc.
        return newNote
    }
    
    // Return the number of Notes in the manager.
    func numberOfNotes() -> Int {
        return self.notes.count
    }

    // Singleton awesomeness. This lazily evaluates this property the first time access it.
    // This way, we only have one instance of NoteManager in the app.
    static let singleton = NoteManager()
}


// Just a simple Note class.
class Note {
    var title : String
    var content : String = ""
    
    init(title:String) {
        self.title = title
    }
    
    // Return the first 30 characters of the content of the note. We're going to use this later
    // for displaying a short preview in a table cell without having to give the cell a big string.
    func getExcerpt() -> String {
        // Strings can't be index by Integers, so we have to use a special Index type. This
        // returns the very start of the String.
        let index = self.content.startIndex
        
        // Get the real length of the excerpt. This ensures that if the entire content is shorter
        // that 30 characters, that we don't have an index too big for the String.
        let length = min(self.content.characters.count, 30)
        
        // Use the .advanceBy method on the index to reference 30 characters into the String.
        let endIndex = index.advancedBy(length)
        
        // Now get the first 30 characters. This is called a "substring," which means a String that
        // comes from slicing an existing String. This indexes from 0 to the given Index object.
        return self.content.substringToIndex(endIndex)
    }
}













