//
//  PhotoServiceManager.swift
//  MyPhotoGallery
//
//  Created by trvslhlt on 11/9/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit

protocol PhotoServiceProtocol {
    static func postPhoto(image: UIImage, title: String, completion: Result<Photo,String> -> ())
    static func getPhotos(completion: (Result<[Photo],String> -> ()))
}

