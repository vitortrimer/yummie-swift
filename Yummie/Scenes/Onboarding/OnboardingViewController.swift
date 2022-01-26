//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Vitor Trimer on 20/01/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var currentPage = 0 {
        didSet {
            onboardingPageControl.currentPage = currentPage
            if currentPage == slides.count-1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        
        
            slides = [
                OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide1")),
                OnboardingSlide(title: "World-class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide2")),
                OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
            ]
        
        onboardingPageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if currentPage == slides.count - 1 {
            debugPrint("works")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            let rect = self.onboardingCollectionView.layoutAttributesForItem(at:indexPath)?.frame
            self.onboardingCollectionView.scrollRectToVisible(rect!, animated: true)
            
        }
    }
    
    
}

//MARK: - CollectionView Delegate and Datasource
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
