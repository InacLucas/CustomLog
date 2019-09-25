//
//  HomeViewController.swift
//  CustomLog
//
//  Created by treinamento on 03/09/19.
//  Copyright © 2019 in.kpro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //setup UI
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func setupLabels() {
        //titleLabel.backgroundColor = .darkGray
        //bodyLabel.backgroundColor  = .lightGray
        
        titleLabel.text = "Welcome, "
        titleLabel.font = UIFont(name: "Futura", size: 34)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = UIColor.init(red: 46/255, green: 2/255, blue: 0/255, alpha: 1)
        bodyLabel.textColor = UIColor.init(red: 199/255, green: 7/255, blue: 0/255, alpha: 1)
        bodyLabel.text = "I'm Lucas and i show you \nsome things about me"
        bodyLabel.numberOfLines = 0
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,bodyLabel])
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        
        
        // stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        // enables autolayout
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        setupLabels()
        
        setupStackView()
        
        // animation
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(handleTapAnimation) ))
        
  
        
    }
    
    @objc fileprivate func handleTapAnimation (){
        
        print("Animating")
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
            
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                
        })
        
        }
        
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
            
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
                
            })
            
        }
    }
}
