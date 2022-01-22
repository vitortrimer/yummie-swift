//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Vitor Trimer on 20/01/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        self.slideImageView.image = slide.image
        self.slideTitleLabel.text = slide.title
        self.slideDescriptionLabel.text = slide.description
    }
    
}

 
