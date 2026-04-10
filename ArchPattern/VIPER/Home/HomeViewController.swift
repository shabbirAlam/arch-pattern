//
//  HomeViewController.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func showUsers(_ users: [User])
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}

class HomeViewController: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol!
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    func showUsers(_ users: [User]) {
        self.users = users
        print("Users:", users.map { $0.name })
        title = "\(users.count) users"
    }
    
    func showLoading() {
        print("Loading...")
    }
    
    func hideLoading() {
        print("Stop Loading")
    }
    
    func showError(_ message: String) {
        print("Error:", message)
    }
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        presenter.didSelectUser(at: 0)
    }
}

// Simulate user tap
extension HomeViewController {
    func simulateUserTap(index: Int) {
        presenter.didSelectUser(at: index)
    }
}
