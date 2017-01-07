//
//  HomeViewController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    var recipes: [Recipe]?
    
    let cellSize = CGSize(width: Screen.WIDTH/2 - 2, height: Screen.WIDTH/2)
    
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
        let layout = HomeViewControllerLayout()
        recipeCollectionView.collectionViewLayout = layout
        
        
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
        
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}

