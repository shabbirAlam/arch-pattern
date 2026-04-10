//
//  HomeRouter.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import UIKit

protocol HomeRouterProtocol {
    func navigateToDetail(user: User)
}

class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func navigateToDetail(user: User) {
        let detailVC = DetailRouter.build(user: user)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeRouter {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
