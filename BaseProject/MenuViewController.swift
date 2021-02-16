//
//  MenuViewController.swift
//  SwiftBaseProject
//
//  Created by Navneet Singh on 15/02/21.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    var array = ["a", "b", "c"]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MenuTableViewCell")
    }
    
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        tableViewCell.nameLabel.text = array[indexPath.row]
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
