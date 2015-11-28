//
//  PostService.swift
//  Assessment5
//
//  Created by trvslhlt on 11/27/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import Foundation

class RedditService: PostServiceProtocol {
    
    static let redditUrl = NSURL(string: "https://reddit.com/.json")!
    
    func getPosts(completion: (posts: [Post]?, error: NSError?) -> ()) {
        let request = NSURLRequest(URL: RedditService.redditUrl)
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil else {
                completion(posts: nil, error: error)
                return
            }

            if let jsonData = data {
                let posts = RedditService.jsonDataToPosts(jsonData)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion(posts: posts, error: nil)
                })
            }
        }.resume()
    }
    
    static func jsonDataToPosts(jsonData: NSData) -> [Post] {
        var posts = [Post]()
        
        let json = JSON(data: jsonData)
        let children = json["data"]["children"]
        for (_,child):(String, JSON) in children {
            let data = child["data"]
            let title = data["title"].string ?? "<no title>"
            let score = data["score"].int ?? 0
            let urlString = data["url"].string ?? ""
            let url = NSURL(string: urlString)
            
            let post = Post(title: title, score: score, url: url)
            posts.append(post)
        }
        return posts
    }
}