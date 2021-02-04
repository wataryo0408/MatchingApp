//
//  ViewController.swift
//  MatchingApp
//
//  Created by 渡邉凌 on 2021/01/31.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        
        let view1 = TopControllView()
        
        let view2 = UIView()
        view2.backgroundColor = .black
        
        let bottomControllView = BottomControllView()
        
        let stackView = UIStackView(arrangedSubviews: [view1, view2, bottomControllView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        [
            
            view1.heightAnchor.constraint(equalToConstant: 100),
            bottomControllView.heightAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach { $0.isActive = true }
    }


}

