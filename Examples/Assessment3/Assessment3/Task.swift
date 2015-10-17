//
//  Task.swift
//  Assessment3
//
//  Created by trvslhlt on 10/17/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class Task {
    
    var title = ""
    var notes = ""
    var isComplete = false
    var isImportant = false
    var isUrgent = false
    var dateDue: NSDate?
    
    func markComplete() {
        isComplete = true
    }
    
    func daysUntilDue() -> Int? {
        guard let dateDue = dateDue else { return nil }
        let today = NSDate()
        let calendar = NSCalendar.currentCalendar()
        return calendar.components(NSCalendarUnit.Day, fromDate: today, toDate: dateDue, options: []).day
    }
}
