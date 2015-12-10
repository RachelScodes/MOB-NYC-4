//
//  ViewController.swift
//  CollectionViewExperiment
//
//  Created by William Martin on 12/7/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit


class ViewController: UIViewController
    ,UICollectionViewDataSource
    ,UICollectionViewDelegate
{
    // Hold onto a reference to this view for later.
    @IBOutlet weak var wordsCollectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the NIB file for the custom cell view. This enables the CollectionView to 
        // associate the NIB file with the corresponding class via the identifier.
        self.registerNib(
            collectionView:self.wordsCollectionView,
            nib:"CustomCollectionViewCell",
            identifier: "custom_text_cell"
        )
    }
    
    // Helper method for loading NIB files for collection views.
    func registerNib(collectionView collectionView: UICollectionView, nib nibName:String, identifier reuseIdentifier:String) {
        let cellNib = UINib(nibName: nibName, bundle: nil)
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // Ditto, but for tables. Not used here but potentially really useful elsewhere.
    func registerNib(tableView tableView: UITableView, nib nibName:String, identifier reuseIdentifier:String) {
        let cellNib = UINib(nibName: nibName, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // A bunch of words that we want to show in a CollectionView.
    let words = ["hello", "doctor", "name", "continue", "yesterday", "tomorrow"]
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.words.count
    }
    
    // This is a similar method to that found in the UITableViewDataSource. We get an indexPath
    // and we're asked to produce an instance (can be of a subclass) of UICollectionViewCell.
    func collectionView(
        collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath
        ) -> UICollectionViewCell
    {
        // Create the cell instance, but cast it to the custom class we created.
        // Best practice: You may want to as? this one and check for the nil using "if let".
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "custom_text_cell",
            forIndexPath: indexPath
            ) as! CustomCollectionViewCell

        // Give this word to the cell to render.
        cell.wordToShow = self.words[indexPath.row]
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // This segue should be set from the ViewController instance, not a cell in the
        // CollectionView. So CTRL+drag from the ViewController's orange icon to the
        // target CellViewController and give the segue the identifier.
        if segue.identifier == "show_cell_detail" {
            let cvc = segue.destinationViewController as! CellViewController
            
            if let indexPaths = self.wordsCollectionView.indexPathsForSelectedItems() {
                let cellIndex = indexPaths[0].row
                
                // Pass the word to the CellViewController.
                cvc.wordToShow = self.words[cellIndex]
            }
        }
    }
    
    // This method enable the tap-to-segue behavior that we're accustomed to
    // with UITableViews. For some reason, it doesn't work quite the same way
    // for UICollectionViews, so we have to catch this event with a delegate
    // method here.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("show_cell_detail", sender: self)
    }
}

