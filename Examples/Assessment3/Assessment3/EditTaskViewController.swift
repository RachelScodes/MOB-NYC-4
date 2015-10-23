//
//  EditTaskViewController.swift
//  Assessment3
//
//  Created by trvslhlt on 10/17/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var isCompleteSwitch: UISwitch!
    @IBOutlet weak var isImportantSwitch: UISwitch!
    @IBOutlet weak var isUrgentSwitch: UISwitch!
    @IBOutlet weak var dueDateDatePicker: UIDatePicker!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTask()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        updateTask()
    }

    func displayTask() {
        guard let newTask = task else { return }
        titleTextField.text = newTask.title
        notesTextView.text = newTask.notes
        isCompleteSwitch.on = newTask.isComplete
        isImportantSwitch.on = newTask.isImportant
        isUrgentSwitch.on = newTask.isUrgent
        dueDateDatePicker.date = newTask.dateDue ?? NSDate()
        dueDateLabel.text = "Number of days to finish: \(task?.daysUntilDue() ?? 0)"
    }
    
    @IBAction func updateTask() {
        guard let task = task else { return }
        task.title = titleTextField.text ?? ""
        task.notes = notesTextView.text ?? ""
        task.isComplete = isCompleteSwitch.on
        task.isImportant = isImportantSwitch.on
        task.isUrgent = isUrgentSwitch.on
        task.dateDue = dueDateDatePicker.date
        displayTask()
    }
    
    //MARK: UITextViewDelegate
    func textViewDidChange(textView: UITextView) {
        updateTask()
    }
}
