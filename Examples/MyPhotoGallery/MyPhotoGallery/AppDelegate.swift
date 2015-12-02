//
//  AppDelegate.swift
//  MyPhotoGallery
//
//  Created by trvslhlt on 11/9/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.enableLocalDatastore()
        Parse.setApplicationId("cK1zJd6wmIp8b7DhfKr5u4056z94KEFkqmOJCF5a",
            clientKey: "AKWank7FuZ0483rcHFXL09tY1PzzKekiiN0qbsga")
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        return true
    }

}

