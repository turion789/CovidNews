//
//  ViewController.swift
//  CovidNews
//
//  Created by turion789 on 4.11.20.
//

import UIKit

class FirstViewController: UIViewController,UITextFieldDelegate {



 
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonGO(_ sender: UIButton) {
        
        login = loginTextField.text!
        redirectionLogo = login
        
    }
    
    var login = ""

    func textFieldCustom(){
        
        loginTextField.backgroundColor = .black
        loginTextField.textColor = .white
        loginTextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        loginTextField.layer.cornerRadius = 9
        loginTextField.layer.masksToBounds = true
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor.white.cgColor
        
        
        let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(named: "userIconLogin")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.white
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imageView)
        loginTextField.leftViewMode = UITextField.ViewMode.always
        loginTextField.leftView = view
        
        
        passwordTextField.backgroundColor = .black
        passwordTextField.textColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        passwordTextField.layer.cornerRadius = 9
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        
        
        let imageViewPassword = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let imagePassword = UIImage(named: "userIconPassword")
        imageViewPassword.image = imagePassword
        imageViewPassword.contentMode = .scaleAspectFit
        imageViewPassword.tintColor = UIColor.white
        let viewPassword = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        viewPassword.addSubview(imageViewPassword)
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.leftView = viewPassword
      
    }
    
    func buttonCustom(){
        
        loginButton.backgroundColor = .black
        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 11
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.white.cgColor
        
    }

    @IBAction func textFieldValueChanged(_ sender: Any){
        
        if loginTextField.text != nil && passwordTextField.text != nil {
            
            return loginButton.isEnabled = true
            
        } else {
            
            return loginButton.isEnabled = false
            
      }
        
    }
     
    override func viewWillAppear(_ animated: Bool) {
        
      super.viewWillAppear(animated)
        loginTextField.text! = ""
        passwordTextField.text! = ""
        loginButton.isEnabled = false
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         textFieldCustom()
         buttonCustom()
         loginButton.isEnabled = false
       
    }

}



