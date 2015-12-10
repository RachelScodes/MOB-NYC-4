//
//  ParsePhotoService.swift
//  MyPhotoGallery
//
//  Created by trvslhlt on 12/1/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit
import Parse

class ParsePhotoService: PhotoServiceProtocol {
    
    static let nameKey = "name"
    static let imageFileKey = "imageFile"
    
    static func postPhoto(image: UIImage, title: String, completion: Result<Photo,String> -> ()) {
        //save image
        guard let imageData = UIImageJPEGRepresentation(image, 0.25), let parseFile = PFFile(name: title, data: imageData) else {
            completion(Result.Failure("failure to resize image"))
            return
        }
        parseFile.saveInBackgroundWithBlock { success, error in
            if let _ = error {
                completion(Result.Failure("failure to save image to Parse"))
            } else {
                //save Photo object
                let parseObject = PFObject(className: "Photo")
                parseObject[nameKey] = title
                parseObject[imageFileKey] = parseFile
                parseObject.saveInBackgroundWithBlock { complete, error in
                    if let _ = error {
                        completion(Result.Failure("failure to save Photo object to Parse"))
                    } else {
                        let photo = Photo(name: title, image: image, imageUrl: NSURL(string:parseFile.url!))
                        completion(Result.Success(photo))
                    }
                }
            }
        }
    }
    
    static func getPhotos(completion: (Result<[Photo],String> -> ())) {
        
        let query = PFQuery(className: "Photo")
        query.orderByDescending("createdAt")
        query.limit = 10
        query.findObjectsInBackgroundWithBlock { pfObjects, error in
            if let _ = error {
                completion(Result.Failure("failure to find Photo objects on Parse"))
            } else {
                if let parsePhotos = pfObjects {
                    let photos: [Photo] = parsePhotos.map { parsePhoto in
                        let name = parsePhoto[nameKey] as! String
                        let imageFile = parsePhoto[imageFileKey] as! PFFile
                        let imageUrl = NSURL(string: imageFile.url!)!
                        return Photo(name: name, image: nil, imageUrl: imageUrl)
                    }
                    completion(Result.Success(photos))
                }
            }
            
        }
    }
    
}
