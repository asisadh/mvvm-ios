//
//  FriendCellViewModel .swift
//  Friends
//
//  Created by Aashish Adhikari on 1/31/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

//  Since the FriendCell is simple and only displays information, it’s good to define it as a protocol and then make the model conform to that protocol. If however, the cell would have a lot of functionality, for example expanding on a click, a button which press needs to be handled, then I would suggest to use a struct or a class. But in this case the simple protocol is a good way forward.

protocol FriendCellViewModel {
    var friendItem: Friend { get }
    var fullName: String { get }
    var phonenumberText: String { get }
}

extension Friend: FriendCellViewModel {
    var friendItem: Friend {
        return self
    }
    var fullName: String {
        return firstName + " " + lastName
    }
    var phonenumberText: String {
        return phoneNumber
    }
}
