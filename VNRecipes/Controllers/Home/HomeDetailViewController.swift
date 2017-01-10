//
//  HomeDetailViewController.swift
//  VNRecipes
//
//  Created by Hung Thai on 1/9/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
import ZoomTransitioning

final class HomeDetailViewController: BaseViewController {

    var pictureImageView: UIImageView!
    @IBOutlet weak var recipeDetailTableView: UITableView!
    
    fileprivate var recipeText: [String] = []
    fileprivate let IMAGE_HEIGHT: CGFloat = RATIO.SCREEN_HEIGHT * (150/568)
    var recipe: Recipe?
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
        self.loadData()
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
        recipeDetailTableView.registerCellNib(anyClass: RecipeDetailTextCell.self)
        recipeDetailTableView.registerCellNib(anyClass: RecipeDetailImageCell.self)
        
        recipeDetailTableView.estimatedRowHeight = 44.0
        recipeDetailTableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func loadData() {
        guard let recipeData = recipe else {
            return
        }
        recipeText = recipeData.content.split(regex: Rex.number)
        recipeDetailTableView.reloadData(with: UITableViewRowAnimation.fade)
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

extension HomeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.detailImages != nil ? (recipe?.detailImages?.count)! + recipeText.count : recipeText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BaseTableViewCell?
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailRecipeText) as! RecipeDetailTextCell
            cell!.configureCell(anyItem: recipeText[indexPath.row])
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailRecipeImage) as! RecipeDetailImageCell
            guard let detailImages = recipe!.detailImages else {
                return cell!
            }
            cell?.configureCell(anyItem: detailImages.elements[indexPath.row])
        }
        return cell!
    }
}

extension HomeDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row % 2 == 0 ? UITableViewAutomaticDimension : IMAGE_HEIGHT
    }
}
