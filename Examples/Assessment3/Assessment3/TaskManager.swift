//
//  TaskManager.swift
//  Assessment3
//
//  Created by trvslhlt on 10/17/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class TaskManager {
    
    let task1 = Task()
    let task2 = Task()
    let task3 = Task()
    var tasks: [Task] { get { return [task1, task2, task3] } }
    static let sharedInstance = TaskManager()
    private init(){
        self.task1.title = "Wash"
        self.task2.title = "Rinse"
        self.task3.title = "Repeat"
    }

}
