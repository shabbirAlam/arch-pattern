//
//  DetailViewProtocol.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func showUser(_ user: User)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .purple
    }

    func showUser(_ user: User) {
        print("User Detail:", user.name)
        title = user.name
    }
}
