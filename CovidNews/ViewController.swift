//
//  ViewController.swift
//  CovidNews
//
//  Created by turion789 on 4.11.20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonGO(_ sender: UIButton) {
    }
    
    
    func textFieldCustom(){
        loginTextField.backgroundColor = .black
        loginTextField.textColor = .white
        loginTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        loginTextField.layer.cornerRadius = 7
        loginTextField.layer.masksToBounds = true
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor.white.cgColor
        
        
        passwordTextField.backgroundColor = .black
        passwordTextField.textColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        passwordTextField.layer.cornerRadius = 7
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        
 
    }
    
    func buttonCustom(){
        loginButton.backgroundColor = .black
        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 6
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    
    override func viewDidLoad() {
       
        textFieldCustom()
        buttonCustom()
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

