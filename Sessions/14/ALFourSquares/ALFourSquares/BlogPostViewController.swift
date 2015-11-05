//
//  BlogPostViewController.swift
//  ALFourSquares
//
//  Created by William Martin on 11/4/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class BlogPostViewController: UIViewController {

    @IBOutlet weak var titleView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titleView.text = "Hello, World!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
