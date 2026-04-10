//
//  DetailPresenter.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import Foundation

protocol DetailPresenterProtocol {
    func viewDidLoad()
}

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var user: User

    init(user: User) {
        self.user = user
    }

    func viewDidLoad() {
        view?.showUser(user)
    }
}
