//
//  TopControllView.swift
//  MatchingApp
//
//  Created by 渡邉凌 on 2021/02/03.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class TopControllView: UIView {
    
    private let disposeBag = DisposeBag()
    
    
    
    let tinderButton = createTopButton(imageName: "fireIcon", imageColor: .rgb(red: 255, green: 20, blue: 147))
//    tinderButton.backgroundColor = .red
    
    let goodButton = createTopButton(imageName: "daiamondIcon", imageColor: .rgb(red: 255, green: 215, blue: 0))
//    goodButton.backgroundColor = .orange
    
    let commentButton = createTopButton(imageName: "chatIcon", imageColor: .rgb(red: 250, green: 128, blue: 114))
//    commentButton.backgroundColor = .green
    
    let profileButton = createTopButton(imageName: "profileIcon", imageColor: .rgb(red: 205, green: 92, blue: 92))
//    profileButton.backgroundColor = .purple
    
    
    static private func createTopButton(imageName: String, imageColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = imageColor

        
        return button
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLayout()
        setUpBindings()
        
        
        if button.isSelected == true {
            button.tintColor = imageColor
        }else if button.isSelected == false{
            button.tintColor = .rgb(red: 75, green: 75, blue: 75)
        }


        
        
    }
    
    private func setUpLayout(){
        
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        [
            baseStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ].forEach { $0.isActive = true }
        
        tinderButton.isSelected = true
    }
    
    
    
    private func setUpBindings(){
        
        tinderButton.rx.tap
            .subscribe { _ in
                self.handleSelectedButton(selectedButton: self.tinderButton)
            }
            
            .disposed(by: disposeBag)
        
        goodButton.rx.tap
            .subscribe { _ in
                self.handleSelectedButton(selectedButton: self.goodButton)

            }
            .disposed(by: disposeBag)
        
        commentButton.rx.tap
            .subscribe { _ in
                self.handleSelectedButton(selectedButton: self.commentButton)

            }
            .disposed(by: disposeBag)
        
        profileButton.rx.tap
            .subscribe { _ in
                self.handleSelectedButton(selectedButton: self.profileButton)

            }
            .disposed(by: disposeBag)
    }
    
    
    private func handleSelectedButton(selectedButton: UIButton){
        let buttons = [tinderButton, goodButton, commentButton, profileButton]
        
        buttons.forEach { (button) in
            if button == selectedButton{
                button.isSelected = true
                
            }else{
                button.isSelected = false
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    }
