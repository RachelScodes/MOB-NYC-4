//
//  Photo.swift
//  MyPhotoGallery
//
//  Created by trvslhlt on 11/9/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

class Photo: NSObject {

    let name: String
    var image: UIImage?
    var imageUrl: NSURL?
    
    init(name: String, image: UIImage?, imageUrl: NSURL? = nil) {
        self.name = name
        self.image = image
        self.imageUrl = imageUrl
        super.init()
    }
    
}