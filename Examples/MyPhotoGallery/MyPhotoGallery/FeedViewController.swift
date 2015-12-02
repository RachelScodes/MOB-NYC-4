//
//  ViewController.swift
//  MyPhotoGallery
//
//  Created by trvslhlt on 11/9/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit


class FeedViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var myName: String?
    typealias PhotoService = ParsePhotoService // can go one step further with generic types to remove static dependency
    var photos: [Photo]? {
        didSet {
            self.collectionView.performBatchUpdates({ () -> Void in
                    self.collectionView.reloadSections(NSIndexSet(index: 0))
                }, completion: nil)
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsZero
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.registerClass(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.defaultCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        let collectionViewKey = "collectionView"
        let topLayoutGuideKey = "topLayoutGuide"
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[\(collectionViewKey)]|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: [collectionViewKey: collectionView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[\(topLayoutGuideKey)][\(collectionViewKey)]|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: [collectionViewKey: collectionView, topLayoutGuideKey: self.topLayoutGuide]))
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.addSubview(self.refreshControl)
        return collectionView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshFeed", forControlEvents: .ValueChanged)
        return refreshControl
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Feed"
        refreshFeed()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.myName == nil {
            if let name = NSUserDefaults.standardUserDefaults().valueForKey("name") as? String {
                self.myName = name
            } else {
                self.configureName()
            }
        }
    }
    
    //MARK: Custom
    func configureName() {
        let nameEntryVC = UIAlertController(title: "Hello", message: "please enter your name", preferredStyle: .Alert)
        nameEntryVC.addTextFieldWithConfigurationHandler(nil)
        let okAction = UIAlertAction(title: "OK", style: .Default) { _ in
            self.myName = nameEntryVC.textFields![0].text
            NSUserDefaults.standardUserDefaults().setValue(self.myName, forKey: "name")
        }
        nameEntryVC.addAction(okAction)
        //https://forums.developer.apple.com/thread/18294
        presentViewController(nameEntryVC, animated: true, completion: nil)
    }
    
    func refreshFeed() {
        refreshControl.endRefreshing()
        PhotoService.getPhotos { getResult in
            switch getResult {
            case .Success(let photos):
                self.photos = photos
            case .Failure(let reason):
                self.notifyUserOfFailure(reason)
            }
        }
    }
    
    func notifyUserOfFailure(reason: String) {
        let alertVC = UIAlertController(title: "Drat", message: reason, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Thanks", style: .Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    //MARK: IBAction
    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        let sourceActionVC = UIAlertController(title: "Add a photo", message: nil, preferredStyle: .ActionSheet)
        let photosAction = UIAlertAction(title: "Photos", style: .Default) { _ in self.presentImagePickerVCWithSourceType(.PhotoLibrary) }
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { _ in self.presentImagePickerVCWithSourceType(.Camera) }
        sourceActionVC.addAction(photosAction)
        sourceActionVC.addAction(cameraAction)
        presentViewController(sourceActionVC, animated: true, completion: nil)
    }
    
    func presentImagePickerVCWithSourceType(sourceType: UIImagePickerControllerSourceType) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
        imagePickerVC.sourceType = sourceType
        presentViewController(imagePickerVC, animated: true, completion: nil)
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PhotoCollectionViewCell.defaultCellIdentifier, forIndexPath: indexPath) as! PhotoCollectionViewCell
        guard let photos = photos else { return cell }
        let photo = photos[indexPath.row]
        cell.configureCellWithTitle(photo.name, image: photo.image, imageUrl: photo.imageUrl)
        return cell
    }
    
    //MARK: UICollectionViewFlowLayoutDelegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            PhotoService.postPhoto(image, title: myName!) { postResult in
                switch postResult {
                case .Success(let photo):
                    self.photos?.insert(photo, atIndex: 0)
                    self.refreshFeed()
                case .Failure(let reason):
                    self.notifyUserOfFailure(reason)
                }
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

