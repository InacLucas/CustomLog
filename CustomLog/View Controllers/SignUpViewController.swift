//
//  SignUpViewController.swift
//  CustomLog
//
//  Created by treinamento on 03/09/19.
//  Copyright © 2019 in.kpro. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    
    func setUpElements () {
        
        errorLabel.alpha = 0
        
        
        // style thee elemnts
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    
    // check the fields and validate the data is correct. if everything is correct , this method returns nil. otherwise, it returns the error message
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            
            emailTextField.text? .trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            
            passwordTextField.text? .trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        // Check if the password is secure
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false{
            
            
            return "Please make sure your password is at least 8 characters, contain a special character and a number"
            
        }
        
        
        
        return nil
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        //validate the fields
        
        let error = validateFields()
        
        if error != nil {
            // there`s somthing wrong with thw fields, show error mensage
            
            showError (message: error!)
        }
        else {
            //create cleaned version of data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = emailTextField.text! .trimmingCharacters(in: .whitespacesAndNewlines)
            
            let password =  passwordTextField.text! .trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //Create the user
            
            Auth.auth().createUser(withEmail: email, password: password){ (result, err) in
                //check for errors
                if err != nil{
                    
                    
                    self.showError(message: "Error creating user")
                    
                }
                    
                else {
                    
                    // USer was created succssfully, now store the first name anda last name
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName,"lastname":lastName, "uid": result!.user.uid]){ (error) in
                        
                        if error != nil {
                            
                            // show error mensage
                            
                            self.showError(message: "Error saving user data")
                            
                        }
                        
                    }
                    //transition to home screen
                    
                    self.transitionToHome()
                }
                
                
                
            }
            
            
        }
        
    }
    func showError(  message:String){
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeViewController =
        storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as?HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
