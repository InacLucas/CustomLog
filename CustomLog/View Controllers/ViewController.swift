//
//  ViewController.swift
//  CustomLog
//
//  Created by treinamento on 03/09/19.
//  Copyright © 2019 in.kpro. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    
    @IBOutlet weak var signUpbutton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    setUpElements()
     
       
        
    }

    func setUpElements() {
        Utilities.styleFilledButton(signUpbutton)
        Utilities.styleFilledButton(loginButton)
        
        
    }
}

