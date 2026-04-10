//
//  HomeInteractor.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import Foundation

protocol HomeInteractorProtocol {
    func fetchUsers()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func didFetchUsers(_ users: [User])
    func didFail(_ error: String)
}

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorOutputProtocol?
    
    func fetchUsers() {
        // Simulate API call
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let users = [
                User(id: 1, name: "Shabbir"),
                User(id: 2, name: "Rahul"),
                User(id: 3, name: "Aman")
            ]
            
            DispatchQueue.main.async {
                self.presenter?.didFetchUsers(users)
            }
        }
    }
}
