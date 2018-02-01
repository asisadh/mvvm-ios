//
//  FriendsTableViewVM.swift
//  Friends
//
//  Created by Aashish Adhikari on 1/31/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

class FriendTableViewVM{
    
    enum FriendTableViewCellType {
        case normal(cellViewModel: FriendCellViewModel)
        case error(message: String)
        case empty
    }
    
    var onShowError: (( _ alert: SingleButton ) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    let friendCells = Bindable([FriendTableViewCellType]())
    let appServerClient = AppServerClient()
    
    func getFriends() {
        showLoadingHUD.value = true
        
        appServerClient.getFriends(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.showLoadingHUD.value = false
            switch result {
            case .success(let friends):
                guard friends.count > 0 else{
                    strongSelf.friendCells.value = [.empty]
                    return
                }
                strongSelf.friendCells.value = friends.flatMap { .normal(cellViewModel: $0 as FriendCellViewModel)}
            case .failure(let error):
                strongSelf.friendCells.value = [.error(message: error?.message ?? "Loading failed, check network connection")]
            }
        })
    }
}


// MARK: - AppServerClient.GetFriendsFailureReason
fileprivate extension AppServerClient.GetFriendsFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Please login to load your friends."
        case .notFound:
            return "Could not complete request, please try again."
        }
    }
}
