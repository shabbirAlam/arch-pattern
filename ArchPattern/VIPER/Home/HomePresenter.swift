//
//  HomePresenter.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad()
    func didSelectUser(at index: Int)
}

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    private var users: [User] = []
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchUsers()
    }
    
    func didSelectUser(at index: Int) {
        guard index < users.count else { return }
        let user = users[index]
        router?.navigateToDetail(user: user)
    }
}

// MARK: - Interactor Output
extension HomePresenter: HomeInteractorOutputProtocol {
    
    func didFetchUsers(_ users: [User]) {
        self.users = users
        view?.hideLoading()
        view?.showUsers(users)
    }
    
    func didFail(_ error: String) {
        view?.hideLoading()
        view?.showError(error)
    }
}
