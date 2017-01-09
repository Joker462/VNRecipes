//
//  HomeDetailViewController.swift
//  VNRecipes
//
//  Created by Hung Thai on 1/9/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
import ZoomTransitioning

class HomeDetailViewController: BaseViewController {

    @IBOutlet weak var pictureHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pictureImageView: UIImageView!
    var heightImage: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        if pictureHeightConstraint.constant < heightImage {
            pictureHeightConstraint.constant = heightImage
        }
    }
    

}


extension HomeDetailViewController: ZoomTransitionDestinationDelegate {
    func transitionDestinationImageViewFrame(forward: Bool) -> CGRect {
        if forward {
            let x: CGFloat = 0.0
            let y = topLayoutGuide.length
            
            let width = view.frame.width
//            var height = width * 2.0 / 3.0
            let height = pictureHeightConstraint.constant
            return CGRect(x: x, y: y, width: width, height: height)
        } else {
            return pictureImageView.convert(pictureImageView.bounds, to: view)
        }
    }
    
    func transitionDestinationWillBegin() {
        pictureImageView.isHidden = true
    }
    
    func transitionDestinationDidEnd(transitioningImageView imageView: UIImageView) {
        pictureImageView.isHidden = false
        pictureImageView.image = imageView.image
    }
    
    func transitionDestinationDidCancel() {
        pictureImageView.isHidden = false
    }
}
