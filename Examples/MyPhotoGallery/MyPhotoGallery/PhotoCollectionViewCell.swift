//
//  PhotoCollectionViewCell.swift
//  MyPhotoGallery
//
//  Created by trvslhlt on 11/30/15.
//  Copyright © 2015 travis holt. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let defaultCellIdentifier = "photoCell"
    private static let defaultTitle = ":D"
    var title = PhotoCollectionViewCell.defaultTitle {
        didSet {
            titleLabel.text = title
        }
    }
    var imageUrl: NSURL? {
        didSet {
            if let url = imageUrl {
                imageView.sd_setImageWithURL(url) { image, error, cacheType, url in
                    switch cacheType {
                    case .None:
                        self.imageView.alpha = 0
                        UIView.animateWithDuration(0.3) {
                            self.imageView.alpha = 1
                        }
                    default: self.imageView.alpha = 1
                    }
                }
            }
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1
        self.contentView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        label.textAlignment = NSTextAlignment.Center
        label.text = defaultTitle
        label.layer.borderWidth = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.whiteColor()
        applyConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyConstraints() {
        for view in [imageView, titleLabel] {
            self.contentView.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("|-[view]-|",
                    options: NSLayoutFormatOptions.AlignAllLeft,
                    metrics: nil,
                    views: ["view": view]))
        }
    
        self.contentView.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("V:|-[imageView][titleLabel(titleLabelHeight)]-|",
                options: NSLayoutFormatOptions.AlignAllLeft,
                metrics: ["titleLabelHeight": 40],
                views: ["imageView": imageView, "titleLabel": titleLabel]))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.imageUrl = nil
        self.title = PhotoCollectionViewCell.defaultTitle
    }
    
    func configureCellWithTitle(title: String, image: UIImage?, imageUrl: NSURL?) {
        self.title = title
        self.imageView.image = image
        self.imageUrl = imageUrl
    }
    
}
