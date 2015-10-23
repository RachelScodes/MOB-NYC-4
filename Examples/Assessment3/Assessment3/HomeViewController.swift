//
//  HomeViewController.swift
//  Assessment3
//
//  Created by trvslhlt on 10/17/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var task1TextField: UITextField!
    @IBOutlet weak var task2TextField: UITextField!
    @IBOutlet weak var task3TextField: UITextField!
    @IBOutlet weak var task1ToDoButton: UIButton!
    @IBOutlet weak var task2ToDoButton: UIButton!
    @IBOutlet weak var task3ToDoButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayTasks()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        updateTaskTitles()
        
        if let editTaskViewController = segue.destinationViewController as? EditTaskViewController {
            var task: Task?
            switch segue.identifier! {
            case "task1": task = TaskManager.sharedInstance.task1
            case "task2": task = TaskManager.sharedInstance.task2
            case "task3": task = TaskManager.sharedInstance.task3
            default: ()
            }
            editTaskViewController.task = task
        }
    }
    
    func updateTaskTitles() {
        TaskManager.sharedInstance.task1.title = task1TextField.text ?? ""
        TaskManager.sharedInstance.task2.title = task2TextField.text ?? ""
        TaskManager.sharedInstance.task3.title = task3TextField.text ?? ""
    }
    
    func displayTasks() {
        task1TextField.text = TaskManager.sharedInstance.task1.title
        task2TextField.text = TaskManager.sharedInstance.task2.title
        task3TextField.text = TaskManager.sharedInstance.task3.title
        setToDoButton(task1ToDoButton, toComplete: TaskManager.sharedInstance.task1.isComplete)
        setToDoButton(task2ToDoButton, toComplete: TaskManager.sharedInstance.task2.isComplete)
        setToDoButton(task3ToDoButton, toComplete: TaskManager.sharedInstance.task3.isComplete)
    }
    
    @IBAction func toDoButtonTapped(sender: UIButton) {
        var task: Task?
        switch sender {
        case task1ToDoButton: task = TaskManager.sharedInstance.task1
        case task2ToDoButton: task = TaskManager.sharedInstance.task2
        case task3ToDoButton: task = TaskManager.sharedInstance.task3
        default: ()
        }
        if let task = task {
            task.isComplete = !task.isComplete
            setToDoButton(sender, toComplete: task.isComplete)
        }
    }
    
    func setToDoButton(button: UIButton, toComplete complete: Bool) {
        let image = complete ? UIImage(named: "check") : nil
        button.setImage(image, forState: .Normal)
    }
    
}








