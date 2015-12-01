//
//  PostDetailViewController.swift
//  Assessment5
//
//  Created by trvslhlt on 11/27/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var post: Post? {
        didSet {
            guard let post = post else { return }
            title = post.title
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadPostUrl()
    }
    
    func loadPostUrl() {
        guard let post = post, let url = post.url else { return }
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }

}
