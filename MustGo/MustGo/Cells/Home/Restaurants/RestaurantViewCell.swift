//
//  RestaurantViewCell.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import UIKit

class RestaurantViewCell: UITableViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var popularMenu: UILabel!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var weekendLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var favoriteButtonTapped: ((Bool) -> Void)?
    
    func configure(_ restaurantData: Restaurant) {
        foodImageView.image = UIImage(named: restaurantData.foodImage)
        nameLabel.text = restaurantData.name
        popularMenu.text = restaurantData.popularMenu
        weekdayLabel.text = restaurantData.weekday
        weekendLabel.text = restaurantData.weekend
        priceLabel.text = "\(restaurantData.price) ₩"
        
        let isFavorite = UserDefaults.standard.bool(forKey: restaurantData.name)
        favoriteButton.isSelected = isFavorite
        
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        favoriteButton.isSelected.toggle()
        favoriteButtonTapped?(favoriteButton.isSelected)
        
        let restaurantName = nameLabel.text ?? ""
        UserDefaults.standard.set(favoriteButton.isSelected, forKey: restaurantName)
    }
}

extension RestaurantViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "RestaurantViewCell", for: indexPath) as? RestaurantViewCell else { return UITableViewCell() }
        let data = restaurantLists[indexPath.row]
        cell.configure(data)
        
        return cell
    }
}

extension RestaurantViewController: UITableViewDelegate {
}
