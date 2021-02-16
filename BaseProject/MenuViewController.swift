//
//  MenuViewController.swift
//  SwiftBaseProject
//
//  Created by Navneet Singh on 15/02/21.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    var savedArray = ["a", "b", "c"]
    var array = ["a", "b", "c"]
    var refreshControl = UIRefreshControl()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MenuTableViewCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
       refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
       tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        array.append(contentsOf: savedArray)
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    //MARK:- IBAction methods
    
    @IBAction func logoutButtonTapped() {
        User.shared.reset()
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = storyBoard.instantiateViewController(identifier: "ViewController")
            let navigationController = UINavigationController(rootViewController: loginViewController)
            self.view.window?.rootViewController = navigationController
        }
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
        return 100
    }
    
    
}
