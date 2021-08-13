//
//  HomeCoordinator.swift
//  SwiftCoordinatorKit
//
//  Created by dxy_hfl on 2021/8/12.
//

import UIKit

class HomeCoordinator: Coordinator<DeekLink> {
    
    private lazy var homeController: HomeViewController = {
        let homeVc = HomeViewController()
        homeVc.delegate = self
        return homeVc
    }()
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(homeController, hideBar: false)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func didTapBackAction() {
        router.popModule(animated: true)
    }
    
    func didTapForwardAction() {
        let vc = OtherViewController()
        router.push(vc, animated: true, completion: nil)
    }
}
