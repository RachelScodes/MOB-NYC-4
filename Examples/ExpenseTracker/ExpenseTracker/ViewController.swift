//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by William Martin on 11/22/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var expenseList : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.displayTotalInTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAdd(sender:AnyObject?) {
        // Instantiate an alert dialog box.
        let alert = UIAlertController(
            title: "New expense",
            message: "Enter the title and amount:",
            preferredStyle:.Alert
        )
        
        // A two text fields to it... Yes, this method appears twice.
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addTextFieldWithConfigurationHandler(nil)
        
        // This is the action that the "Add" button will call.
        func createNewExpense(action:UIAlertAction!) {
            
            // Get the values from the two text fields we just added.
            let title = alert.textFields![0].text!
            let amountStr = alert.textFields![1].text!
            
            // Get the current amount the user is adding.
            if let amount = Double(amountStr) {
                // Call the "create" method on the ExpenseManager instance to create a new
                // Expense, add it to the list of expenses, and store it in Core Data.
                ExpenseManager.singleton.create(title, amount: amount)
            }
            
            // Redraw the table view with the new Expense just created.
            self.expenseList.reloadData()
            
            // Recalculate the total expense.
            self.displayTotalInTitle()
        }
        
        // Add an "Add" button to the dialog.
        let addAction = UIAlertAction(title:"Add", style:.Default, handler:createNewExpense)
        alert.addAction(addAction)
        
        // Then add a "Cancel" button to the dialog. Note that it doesn't have a handler function.
        let cancelAction = UIAlertAction(title:"Cancel", style:.Default, handler:nil)
        alert.addAction(cancelAction)
        
        // Then "present" the alert dialog to the user.
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // This method updates the title of the View Controller with the sum of all the amounts entered.
    func displayTotalInTitle() {
        // Loop through all the cells and add up all the .amount values.
        var total = 0.0
        for expense in ExpenseManager.singleton.expenses {
            total += expense.amount
        }
        
        // Every UIViewController instance has a .title property that shows a string in the
        // middle of its navigation bar (if it has one).
        self.title = String(total)
    }
    
    
    // MARK: - Table View stuff

    // There will only be one section in this table, as we only have one type of thing to show,
    // a list of Expenses.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows in the table's single section, which will equal the number of
    // Expenses in the ExpenseManager.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpenseManager.singleton.expenses.count
    }
    
    // This method contains a standard pattern for producing a NSTableCellView for a table's row.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Produce the table cell instance by asking the table view for one of the cells it has
        // saved for reuse.
        let cell = tableView.dequeueReusableCellWithIdentifier("expense_cell", forIndexPath: indexPath)
        
        // Get the expense this row is supposed to show.
        let expense = ExpenseManager.singleton.expenses[indexPath.row]
        
        // Populate the cell with the data from the Expense instance to show it to the user.
        cell.textLabel?.text = expense.title
        cell.detailTextLabel?.text = String(expense.amount)
        
        // Return the table cell instance to the table.
        return cell
    }
    
    // Enables the left-swipe delete button.
    func tableView(
        tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath
        )
    {
        if editingStyle == .Delete {
            ExpenseManager.singleton.deleteAt(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            self.displayTotalInTitle()
        }
    }
}

