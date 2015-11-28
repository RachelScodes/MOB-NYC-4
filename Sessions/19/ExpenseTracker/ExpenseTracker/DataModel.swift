//
//  DataModel.swift
//  ExpenseTracker
//
//  Created by William Martin on 11/22/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit
import CoreData


// A singleton that wraps up all of the behavior to manage a list of Expenses.
//
// The advantages of this technique become more evident when we retrofit our
// initial implementation and embed Core Data code inside.
class ExpenseManager {
    
    // Create a singleton that will manage all the Expenses the user creates.
    static let singleton = ExpenseManager()
    
    // Holds all the Expense instances that we're going to ultimately show in a UITableView.
    var expenses : [Expense] = []
    
    // Return the single instance of AppDelegate created when the app starts.
    var appDelegate : AppDelegate {
        return UIApplication.sharedApplication().delegate! as! AppDelegate
    }
    
    // The "Managed Object Context" responsible for managing all the Core Data objects.
    var moc : NSManagedObjectContext {
        return self.appDelegate.managedObjectContext
    }
    
    // A reference to the Core Data Expense "class."
    var expenseEntity : NSEntityDescription {
        return NSEntityDescription.entityForName("Expense", inManagedObjectContext: self.moc)!
    }
    
    init() {
        // Describes the "fetch request" we want to make to Core Data, which is like describing
        // a network request for an API. It enables us to describe what data we want to retrieve,
        // in this case, all of our "Expense" data.
        let request = NSFetchRequest(entityName: "Expense")
        
        // Now, we actually have to execute the fetch request. We do this by calling the method
        // "executeFetchRequest" on the current Managed Object Context. 
        //
        // The problem here is that the fetch can fail badly. The method can "throw" an Exception, 
        // an error that the app can't recover from. Thus, we need to use the do-try-catch construct 
        // to handle this case.
        do {
            // Execute the fetch, then take all the resulting objects, cast them to an Array of
            // Expenses (with the "as!" keyword), and store it in the "expenses" property. Now,
            // all of these Expense objects will be available anywhere in the app.
            self.expenses = try self.moc.executeFetchRequest(request) as! [Expense]
        } catch {
            print("Could not load Expenses from Core Data!")
            // TODO: - Notify the user and give the user a way to retry and/or report the error.
        }
    }
    
    // A method to create a new Expense object and add it to our list of Expenses.
    //
    // Having this separate "create" method enables us to first create a working version of the
    // app without Core Data, then retrofit it later with Core Data functions. Since we put
    // all the creation code here, we can swap it out without ever having to change code in any
    // other place. This is "encapsulation."
    func create(title:String, amount:Double) -> Expense {
        
        // Instantiate an instance of the Core Data Entity we defined in the xcdatamodeld file.
        // This is called a "Managed Object."
        let newExpense = Expense(entity: self.expenseEntity, insertIntoManagedObjectContext: self.moc)
        
        // Set the values of the Core Data "attributes" of this Managed Object.
        newExpense.title = title
        newExpense.amount = amount
        
        // Append it to the list of expenses so we can keep track of it in the app.
        self.expenses.append(newExpense)
        
        // Save the Managed Object Context to store the expense in Core Data.
        self.save()
        
        // Return it just in case the caller needs it. This app doesn't, but it's often good policy.
        return newExpense
    }
    
    // Given an index, deletes the Expense at the index.
    func deleteAt(index:Int) {
        // Remove the Expense at the given index from the Array and hold on to a reference to it.
        // We'll need this reference to tell Core Data what to remove.
        let deletedExpense = self.expenses.removeAtIndex(index)
        
        // Ask Core Data to remove the Expense from its records.
        self.moc.deleteObject(deletedExpense)
        
        // Then save the Managed Object Context. This actually performs the deletion.
        self.save()
    }
    
    
    // Saves any changes to any managed objects.
    func save() {
        // All this method does is call the "saveContext" method that Xcode wrote for us when
        // first creating the app.
        self.appDelegate.saveContext()
    }
}


// The actual Expense class that holds onto the data for a particular purchase the user made.
class Expense : NSManagedObject {
    // The @NSManaged macro here indicates that Core Data will help manage the value of this
    // property. While Core Data will load this value when the Expense is "fetched," we can set
    // these values, and then save the corresponding "Managed Object Context," which asks
    // Core Data to persist this information on the iPhone.
    @NSManaged var title : String
    @NSManaged var amount : Double
}


