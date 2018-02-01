//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Aashish Adhikari on 1/31/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let viewModel: FriendTableViewVM = FriendTableViewVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getFriends()
    }
    
    func bindViewModel() {
        viewModel.friendCells.bindAndFire() { [weak self] _ in
            self?.tableView?.reloadData()
        }
        
        viewModel.showLoadingHud.bind() { visible in
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            visible ? PKHUD.sharedHUD.show() : PKHUD.sharedHUD.hide()
        }
    }
}

// MARK: - UITableViewDelegate
extension FriendsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendCells.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.friendCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as? FriendTableViewCell else {
                return UITableViewCell()
            }
            cell.viewModel = viewModel
            return cell
        case .error(let message):
            let cell = UITableViewCell()
            cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.textLabel?.text = "No data available"
            return cell
        }
    }
}
