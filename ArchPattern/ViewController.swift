//
//  ViewController.swift
//  ArchPattern
//
//  Created by Md Shabbir Alam on 09/04/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    @IBAction func homeButtonAction(_ sender: Any) {
        let vc = HomeRouter.build()
        navigationController?.pushViewController(vc, animated: true)
    }
}
