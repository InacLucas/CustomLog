//
//  Utilities.swift
//  CustomLog
//
//  Created by treinamento on 04/09/19.
//  Copyright © 2019 in.kpro. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField( textField:UITextField) {
        // create button line
        let bottomLine  = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height, width: textField.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // remove border on text field
        
        textField.borderStyle = .none
        
        // add the line to the text field
        textField.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton( button:UIButton){
        
        //filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton( button:UIButton){
        
        //hollow round corner  style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
        
        
        
    }
}


static func isPasswordValid( password: String) -> Bool{
    
    let passwordTest  = NSPredicate(format: "SELF MATCHES%@", <#T##args: CVarArg...##CVarArg#>)
    
    
}
