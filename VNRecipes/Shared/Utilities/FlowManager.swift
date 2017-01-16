//
//  FlowManager.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/16/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import Foundation
import UIKit
final class FlowManager {
    // MARK: Recipe Screen
    static func presentDetailRecipeVC(navigationController: UINavigationController, imageView: UIImageView, recipe: Recipe) {
       let detailRecipeVC = RecipeDetailViewController.instantiateFromStoryboard(storyboardName: StoryBoard.recipe)
        detailRecipeVC.recipe = recipe
        detailRecipeVC.heightImage = imageView.bounds.size.height
        navigationController.pushViewController(detailRecipeVC, animated: true)
    }
}
