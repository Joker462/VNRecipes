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

    var pictureImageView: UIImageView!
    @IBOutlet weak var recipeDetailTableView: UITableView!
    
    var heightImage: CGFloat = 250.0 {
        didSet {
            if heightImage < 250.0 {
                heightImage = 250.0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        
        
    }
    
    override func initUI() {
        super.initUI()
        // Create header for table view
        pictureImageView = UIImageView(frame: CGRect(x: 0.0, y: topLayoutGuide.length, width: view.frame.width, height: heightImage))
        pictureImageView.contentMode = .scaleAspectFill
        pictureImageView.clipsToBounds = true
        recipeDetailTableView.tableHeaderView = pictureImageView
        
        recipeDetailTableView.backgroundColor = UIColor.black
        recipeDetailTableView.separatorStyle = .none
        
    }

}


extension HomeDetailViewController: ZoomTransitionDestinationDelegate {
    func transitionDestinationImageViewFrame(forward: Bool) -> CGRect {
        if forward {
            let x: CGFloat = 0.0
            let y = topLayoutGuide.length
            let width = view.frame.width
            let height = heightImage
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
