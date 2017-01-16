//
//  HomeDetailViewController.swift
//  VNRecipes
//
//  Created by Hung Thai on 1/9/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
import ZoomTransitioning

final class RecipeDetailViewController: BaseViewController {
    
    var pictureImageView: UIImageView!
    @IBOutlet weak var recipeDetailTableView: UITableView!
    
    fileprivate var recipeContent: [String] = []
    fileprivate let IMAGE_HEIGHT: CGFloat = 150/568 * Screen.HEIGHT
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
        recipeDetailTableView.registerCellNib(anyClass: IngredientCell.self)
        
        recipeDetailTableView.estimatedRowHeight = 44.0
        recipeDetailTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func loadData() {
        guard let recipeData = recipe else {
            return
        }
        recipeContent = recipeData.content.split(regex: Rex.number)
        if recipeData.detailImages != nil {
            for i in 0..<recipeData.detailImages!.elements.count {
                recipeContent.insert(recipeData.detailImages!.elements[i].url, at: (i*2) + 1)
            }
        }
        
        recipeDetailTableView.reloadData(with: UITableViewRowAnimation.fade)
    }
    
}


extension RecipeDetailViewController: ZoomTransitionDestinationDelegate {
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

extension RecipeDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return recipeContent.count
        }
        else {
            return recipe?.ingredients != nil ? recipe!.ingredients!.elements.count : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BaseTableViewCell?
        if indexPath.section == 0 {
            if recipe?.detailImages == nil {
                cell = setupContentText(indexPath: indexPath)
            }
            else {
                if indexPath.row % 2 == 0 {
                    cell = setupContentText(indexPath: indexPath)
                }
                else {
                    cell = setupContentImage(indexPath: indexPath)
                }
            }
        }
        else {
            cell = setupIngredient(indexPath: indexPath)
        }
        return cell!
    }
    
    func setupContentImage(indexPath: IndexPath) -> RecipeDetailImageCell {
        let cell = recipeDetailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailRecipeImage) as! RecipeDetailImageCell
        cell.configureCell(anyItem: recipeContent[indexPath.row])
        return cell
    }
    
    func setupContentText(indexPath: IndexPath) -> RecipeDetailTextCell {
        let cell = recipeDetailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailRecipeText) as! RecipeDetailTextCell
        cell.configureCell(anyItem: recipeContent[indexPath.row])
        return cell
    }
    
    
    func setupIngredient(indexPath: IndexPath) -> IngredientCell {
        let cell = recipeDetailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.ingredient) as! IngredientCell
        cell.configureCell(anyItem: recipe!.ingredients!.elements[indexPath.row])
        return cell
    }
}
extension RecipeDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return indexPath.row % 2 == 0 ? UITableViewAutomaticDimension : IMAGE_HEIGHT
        }
        else {
            let ingredient = recipe!.ingredients!.elements[indexPath.row]
            let text = ingredient.title + ingredient.unit
            return text.heightWithConstrainedWidth() + 16
        }
    }
}
