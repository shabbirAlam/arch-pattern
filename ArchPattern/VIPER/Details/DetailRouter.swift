//
//  DetailRouter.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 10/04/26.
//

import UIKit

class DetailRouter {
    static func build(user: User) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(user: user)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
