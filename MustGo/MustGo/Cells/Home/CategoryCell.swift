//
//  CategoryCell.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configure(categoryData: Category) {
        categoryLabel.text = categoryData.category
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryLists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryLists[section].lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        let data = categoryLists[indexPath.section].lists[indexPath.row]
        cell.configure(categoryData: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category: String
        
        switch indexPath {
        case IndexPath(row: 0, section: 0): category = "한식"
        case IndexPath(row: 1, section: 0): category = "양식"
        case IndexPath(row: 2, section: 0): category = "중식"
        case IndexPath(row: 3, section: 0): category = "일식"
        case IndexPath(row: 4, section: 0): category = "분식"
        case IndexPath(row: 5, section: 0): category = "기타"
            
        case IndexPath(row: 0, section: 1): category = "고깃집"
        case IndexPath(row: 1, section: 1): category = "횟집"
        case IndexPath(row: 2, section: 1): category = "요리주점"
        case IndexPath(row: 3, section: 1): category = "족발/보쌈"
        case IndexPath(row: 4, section: 1): category = "곱창/막창"
            
        case IndexPath(row: 0, section: 2): category = "돈가스"
        case IndexPath(row: 1, section: 2): category = "치킨/피자"
        case IndexPath(row: 2, section: 2): category = "맥주/호프"
            
        case IndexPath(row: 0, section: 3): category = "다이어트"
        case IndexPath(row: 1, section: 3): category = "패스트푸드"
        case IndexPath(row: 2, section: 3): category = "카페/디저트"
        default: return
        }
        
        let restaurants = Restaurant.lists.filter { $0.category == category }
        let viewController = UIStoryboard(name: "Restaurants", bundle: nil).instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        viewController.title = category
        viewController.restaurantLists = restaurants
        navigationController?.pushViewController(viewController, animated: true)
    }
}
