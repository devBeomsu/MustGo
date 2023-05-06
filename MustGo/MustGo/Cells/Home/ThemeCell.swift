//
//  ThemeCell.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import UIKit

class ThemeCell: UICollectionViewCell {
    @IBOutlet weak var themeView: UIView!
    @IBOutlet weak var themeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        themeView.layer.borderWidth = 1
        themeView.layer.cornerRadius = 10
        themeView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(themeData: ThemeCategory) {
        themeLabel.text = themeData.themeLabel
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ThemeCell", for: indexPath) as? ThemeCell else { return UICollectionViewCell() }
        let data = themeLists[indexPath.item]
        cell.configure(themeData: data)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let theme = themeLists[indexPath.item]
        
        if indexPath.item < themeLists.count {
            if indexPath.item == 0 {
                let viewController = UIStoryboard(name: "TogetherFeed", bundle: nil).instantiateViewController(withIdentifier: "TogetherFeedViewController") as! TogetherFeedViewController
                viewController.title = theme.themeLabel
                navigationController?.pushViewController(viewController, animated: true)
            } else if indexPath.item == 9 {
                let viewController = UIStoryboard(name: "Decision", bundle: nil).instantiateViewController(withIdentifier: "DecisionViewController") as! DecisionViewController
                viewController.title = theme.themeLabel
                navigationController?.pushViewController(viewController, animated: true)
            } else {
                let viewController = UIStoryboard(name: "Themes", bundle: nil).instantiateViewController(withIdentifier: "ThemesViewController") as! ThemesViewController
                viewController.title = theme.themeLabel
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ThemeCell", for: indexPath) as? ThemeCell else { return .zero }
        cell.themeLabel.sizeToFit()
        
        let width = cell.themeLabel.frame.width + 30
        let height: CGFloat = 50
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
