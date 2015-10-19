# GA MOB 4 - Lesson Plan 10 - Table Views

## Lesson Objectives

* Deploy UITableViews in View Controllers.
* Know what it means to "meet a Protocol."
* Create "delegate" objects and describe the delegation pattern.
* Select between the default table cell templates.
* Implement passing data from master table to the detail View Controller.
* Customize table view cells (without NIB files).

## Topics

* Delegation pattern
* Protocols
* UITableView
  * delegates
  * dataSources
* UITableViewCell templates
* Using "viewWithTag"

## Outline

### What are table views?

* One-dimensional lists of pieces of information.
* One of the most common views

### Where do we find table views?

Examples from a bunch of apps.

* Contacts
* Twitter
* Meetup
* Mail
* Calendar

### Breakdown of a table view

* Structure: sections of rows
* What we need to use one:
    * Description of what a row looks like.
    * Something to give us the right information to show.
    * Description of how to take the information and populate a row.
    * Something to handle various events, like selection.

### How do we use a Table View?

The actual UIKit views:

* UITableView
* UITableViewCell
* Views contained in each view cell

Map data elements to a section and row

* Use NSIndexPath to refer to a cell.

### Delegates

* What is a delegate? Reference to another object that provides additional, sometimes required, functionality to an existing object.
* Why use one? We have more than one way of changing the behavior of a class:
    * Extending a class is the first we learned.
    * Now we have referencing a particular object.
    * Also have "extend" keyword for Swift.
* To actually use the delegate, you need to know what methods the delegate has. Whatever the object is, it has to have those methods.
* If someone else provides the delegate, you need to have a "contract" that declares the methods the delegate needs to have to serve as a proper delegate.
* Those contracts are called "Protocols"

### Example of a delegate

* Publication app - takes a folder of text files and produces a website or PDF.
* Two delegate objects:
    * renderer - slideshow, website, pdf
    * publisher - file system, ftp server, Amazon S3

### Protocols

* What is a protocol?
* How to define one?
* Required and optional methods
* Applying a protocol to a class.

### UITableViews

* Add table view to a View Controller
* Can have 2 delegates: a "delegate" and a "dataSource". Only dataSource is required.
* dataSource property
    * UITableViewDataSource protocol
    * [https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDataSource_Protocol/](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDataSource_Protocol/)
    * Two required methods.
        * tableView:cellForRowAtIndexPath:
        * tableView:numberOfRowsInSection:
* delegate property
    * UITableViewDelegate protocol
    * [https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDelegate_Protocol/](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDelegate_Protocol/)
* Add the UITableViewDataSource protocol to the ViewController.
* Add data to show in the table.
* Provide the two required methods cellForRowAtIndexPath: and numberOfRowsInSection:.

    func tableView(
            tableView: UITableView,
            numberOfRowsInSection section: Int
        ) -> Int
    {
        return self.items.count
    }

    func tableView(
            tableView: UITableView,
            cellForRowAtIndexPath indexPath: NSIndexPath
        ) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "note_cell",
            forIndexPath: indexPath
            )

        let item = self.items[indexPath.row]
        cell.textLabel!.text = item

        return cell
    }


Note that these objects (dataSource and delegate) can be:

* The parent UIViewController.
* Another object held as a property in the ViewController and assigned manually to the UITableView held in an IBOutlet.

### Building a Notes app

1. Build a data model to manage notes.
2. Note and NoteManager class.
3. Singleton for the NoteManager.
4. Methods to create a note, get a note, etc.
5. Add a UITableView to the ViewController.
6. Create a NoteViewController with title (UITextField) and content (UITextView) views.
7. Add a + for creating a new note.
8. Hook up two segues.
    1. create_note segue
    2. edit_note segue
9. Hook up the UITableView using dataSource.
10. Define the two require methods (numberOfRowsInSection and cellForRowAtIndexPath)
11. Reference the table view in an IBOutlet.
12. Override prepareForSegue.
13. Check for the segue identifier ("edit_note" or "new_note").
14. Use the sender: parameter to get the UITableViewCell.
15. Use the table IBOutlet reference to get the indexPath with indexPathForCell.
16. Get the destinationViewController and set the note to be edited.
17. If creating a Note, then create one and pass a blank on into the destinationViewController.
18. In NoteViewController, whenever edits occur to the views, set the properties on the Note.


### Customizing a cell prototype.

How to reference views in a table view cell without a NIB or custom class. Create a new prototype to change the appearance of the Note cell.


    let cell = tableView.dequeueReusableCellWithIdentifier(
        "cell_identifier",
        forIndexPath:indexPath
        )

    let title = cell.viewWithTag(1) as UILabel
    let checkbox = cell.viewWithTag(2) as UIButton

    let task = TaskManager.sharedInstance().getTask(indexPath.row)
