//
//  MineCoordinator.swift
//  SwiftCoordinatorKit
//
//  Created by dxy_hfl on 2021/8/12.
//

import Foundation

class MineCoordinator: Coordinator<DeekLink> {
    
    private lazy var mineController: MineViewController = {
        let homeVc = MineViewController()
        return homeVc
    }()
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(mineController, hideBar: false)
    }
}
