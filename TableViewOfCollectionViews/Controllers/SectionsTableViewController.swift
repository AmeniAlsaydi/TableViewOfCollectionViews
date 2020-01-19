//
//  SectionsTableViewController.swift
//  TableViewOfCollectionViews
//
//  Created by Amy Alsaydi on 1/18/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class SectionsTableViewController: UITableViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dogSectionCell", for: indexPath) as! DogTableViewCell
             //Configure the cell...
            return cell
        }
        
        return UITableViewCell() // not sure how this works
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cell = cell as? DogTableViewCell {
                cell.collectionView.dataSource = self // this controller
                cell.collectionView.reloadData() // ?
            
            }
        }
    }
}


extension SectionsTableViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
