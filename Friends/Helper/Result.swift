//
//  Result.swift
//  Friends
//
//  Created by Aashish Adhikari on 1/31/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

enum Result<T, U> where U: Error {
    case success(payload: T)
    case failure(U?)
}
