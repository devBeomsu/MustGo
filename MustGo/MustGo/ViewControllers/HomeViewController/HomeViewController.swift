//
//  ViewController.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import UIKit

class HomeViewController: UIViewController {
    let themeLists: [ThemeCategory] = ThemeCategory.list
    let categoryLists = CategorySection.generateData()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        collectionView.contentInset = UIEdgeInsets(
            top: 0, left: 20, bottom: 0, right: 20)
        if let flowLayout =
            collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        {
            flowLayout.estimatedItemSize = .zero
        }
    }
}
