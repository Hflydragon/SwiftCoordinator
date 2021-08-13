//
//  AppCoordinator.swift
//  SwiftCoordinatorKit
//
//  Created by dxy_hfl on 2021/8/11.
//

import UIKit

class AppCoordinator: WindowCoordinator<DeekLink>, UITabBarControllerDelegate {
    let tabBarController = UITabBarController()
    
    var tabs: [UIViewController : Coordinator<DeekLink>] = [:]
    
    private lazy var homeCoordinator: HomeCoordinator = {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let router = Router(navigationController: navigationController)
        let coordinator = HomeCoordinator(router: router)
        return coordinator
    }()
    
    private lazy var mineCoordinator: MineCoordinator = {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let router = Router(navigationController: navigationController)
        let coordinator = MineCoordinator(router: router)
        return coordinator
    }()
    
    override init(router: WindowRouterType) {
        super.init(router: router)
        
        router.setRootModule(tabBarController)
        router.window.makeKeyAndVisible()
        
        tabBarController.delegate = self
        setTabs([homeCoordinator, mineCoordinator])
    }
    
    override func start(with link: DeekLink?) {
        guard let link = link else {
            return
        }
        switch link {
        case .home:
            break
        case .mine:
            break
        }
    }
    
    func setTabs(_ coordinators: [Coordinator<DeekLink>], animation: Bool = false) {
        tabs = [:]
        let vcs = coordinators.map { coordinator -> UIViewController in
            let viewController = coordinator.toPresentable()
            tabs[viewController] = coordinator
            return viewController
        }
        tabBarController.setViewControllers(vcs, animated: false)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
