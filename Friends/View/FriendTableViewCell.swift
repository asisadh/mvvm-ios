//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Aashish Adhikari on 1/31/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!

    var viewModel: FriendCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        labelFullName?.text = viewModel?.fullName
        labelPhoneNumber?.text = viewModel?.phonenumberText
    }

}
