//
//  Post.swift
//  Assessment6
//
//  Created by trvslhlt on 11/14/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import Foundation

protocol PostServiceProtocol {
    func getPosts(completion: (posts: [Post]?, error: NSError?) -> ())
}

class Post {
    
    let title: String
    let score: Int
    let url: NSURL?
    
    init(title: String, score: Int, url: NSURL?) {
        self.title = title
        self.score = score
        self.url = url
    }
    
}
