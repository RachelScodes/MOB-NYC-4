//
//  CustomCollectionViewCell.swift
//  CollectionViewExperiment
//
//  Created by William Martin on 12/7/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// This is a custom class we've created (along with an associated NIB file) to
// give us complete control over the contents of the UICollectionViewCell.
class CustomCollectionViewCell: UICollectionViewCell {

    required init?(coder aDecoder: NSCoder) {
        self.wordToShow = ""
        super.init(coder:aDecoder)
    }
    
    // This is a property that has a didSet clause, which enables us to manipulate
    // the value shown by the textLabel just by setting it. Beware of this technique,
    // as the textLabel may not be instantiated yet under some unknown circumstance.
    var wordToShow : String {
        didSet {
            if let _ = self.textLabel {
                self.textLabel!.text = self.wordToShow
            }
        }
    }
    
    // This UILabel references the one placed in the corresponding NIB file.
    @IBOutlet weak var textLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
