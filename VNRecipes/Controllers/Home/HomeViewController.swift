//
//  HomeViewController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import UIKit
import AVFoundation
import ZoomTransitioning

class HomeViewController: BaseViewController {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    var recipes: [Recipe]?
    fileprivate var selectedImageView: UIImageView?
    let cellSize = CGSize(width: Screen.WIDTH/2 - 10, height: Screen.WIDTH/2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        loadData()
    }
    
    override func initUI() {
        super.initUI()
        guard let item = tabBarController?.tabBar.items?[0] else {
            return
        }
        title = item.title
        
        recipeCollectionView.backgroundColor = UIColor.clear
        recipeCollectionView.registerCellNib(anyClass: RecipeCell.self)
    
//        let flowLayout = HomeViewControllerLayout()
//        recipeCollectionView.collectionViewLayout = flowLayout
        
        // Set controller as delegate for layout
        if let layout = recipeCollectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        recipeCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
    }
    
    override func loadData() {
        RecipeAPI.sharedInstance.getRecipes { [unowned self] (requestStatus) in
            switch requestStatus {
            case .success(let recipes):
                self.recipes = recipes
                self.recipeCollectionView.reloadData()
                break
            case .failed(let error):
                print(error ?? "Error")
                break
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.recipe, for: indexPath) as! RecipeCell
        cell.configureCell(anyItem: recipes![indexPath.row])
        
        return cell
    }
}

// MARK: UICollecionViewDelegate 
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RecipeCell
        selectedImageView = cell.photoImageView
        
        let detailVC = HomeDetailViewController.instantiateFromStoryboard(storyboardName: "Recipe")
        detailVC.heightImage = cell.photoImageView.frame.size.height
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return cellSize
//    }
//}

extension HomeViewController : PinterestLayoutDelegate {
    
    // This provides the height of the photos
    
    /* It uses AVMakeRectWithAspectRatioInsideRect() from AVFoundation to calculate a height that retains the photo’s aspect ratio, restricted to the cell’s width.
     */
    
    func collectionView(_ collectionView:UICollectionView,
                        heightForPhotoAtIndexPath indexPath: NSIndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        
        let recipe = recipes![indexPath.item]
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let sizeImage = CGSize(width: recipe.widthImage.convertToCGFloat(), height: recipe.heightImage.convertToCGFloat())
        let rect  = AVMakeRect(aspectRatio: sizeImage, insideRect: boundingRect)
        
        return rect.size.height
    }
    
    // This calculates the height of the photo’s comment based on the given font and the cell’s width
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: NSIndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        
        let annotationPadding = CGFloat(8)
        let annotationHeaderHeight = CGFloat(17)
        let recipe = recipes![indexPath.item]
        let font = UIFont.systemFont(ofSize: 10.0)
        let commentHeight = recipe.heightForText(font, width: width)
        
        /* You then add that height to a hard-coded annotationPadding value for the top and bottom, as well as a hard-coded annotationHeaderHeight that accounts for the size of the annotation title.
         */
        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        
        return height
    }
}

extension HomeViewController: ZoomTransitionSourceDelegate {
    func transitionSourceImageView() -> UIImageView {
        return selectedImageView ?? UIImageView()
    }
    
    func transitionSourceImageViewFrame(forward: Bool) -> CGRect {
        guard let selectedImageView = selectedImageView else { return CGRect.zero }
        return selectedImageView.convert(selectedImageView.bounds, to: view)
    }
    
    func transitionSourceWillBegin() {
        selectedImageView?.isHidden = true
    }
    
    func transitionSourceDidEnd() {
        selectedImageView?.isHidden = false
    }
    
    func transitionSourceDidCancel() {
        selectedImageView?.isHidden = false
    }
}

