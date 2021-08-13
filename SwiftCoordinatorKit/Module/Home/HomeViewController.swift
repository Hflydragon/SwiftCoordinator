//
//  HomeViewController.swift
//  SwiftCoordinatorKit
//
//  Created by dxy_hfl on 2021/8/11.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapBackAction()
    func didTapForwardAction()
}

class HomeViewController: UITableViewController {
    
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        let btn = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        btn.setTitle("返回", for: .normal)
        btn.addTarget(self, action: #selector(didTapBackAction), for: .touchUpInside)
        view.addSubview(btn)
        
        let btn1 = UIButton(frame: CGRect(x: 200, y: 100, width: 100, height: 100))
        btn1.setTitle("进入下一页", for: .normal)
        btn1.addTarget(self, action: #selector(didTapForwardAction), for: .touchUpInside)
        view.addSubview(btn1)
    }
    
    @objc func didTapBackAction() {
        delegate?.didTapBackAction()
    }
    
    @objc func didTapForwardAction() {
        delegate?.didTapForwardAction()
    }
}
