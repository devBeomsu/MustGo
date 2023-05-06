//
//  RestaurantViewController.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import UIKit

class RestaurantViewController: UIViewController {
    var restaurantLists: [Restaurant] = Restaurant.lists {
        didSet {
            if let tableView = self.tableView {
                tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        let nibName = UINib(nibName: "RestaurantViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "RestaurantViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 145
    }
}
