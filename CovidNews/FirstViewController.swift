//
//  ViewController.swift
//  CovidNews
//
//  Created by turion789 on 4.11.20.
//

import UIKit
import KeychainAccess


class UserModel: NSObject, NSCoding {
    let loginName:String
    
    init(loginName: String) {
        self.loginName = loginName
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(loginName, forKey: "loginName")
        
    }
    required init?(coder: NSCoder) {
        loginName = coder.decodeObject(forKey: "loginName") as? String ?? ""
        
       }
    
}

class FirstViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonGO(_ sender: UIButton) {
        redirectionLogo = loginTextField.text!
        let nameLoginIn = loginTextField.text!.trimmingCharacters(in: .whitespaces)
        let userObject = UserModel(loginName: nameLoginIn)
        UserSettings.userName = nameLoginIn
        UserSettings.userModel = userObject
        
        let keychain: Keychain
        keychain = Keychain()
        keychain[loginTextField.text!] = passwordTextField.text

        dismiss(animated: true, completion: nil)
    }
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
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
        
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: .curveEaseInOut,
                       animations: {
                        self.loginTextField.center.y -= 1000
        }, completion: { _ in
        })
        
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.6,
                       options: .curveEaseInOut,
                       animations: {
                        self.passwordTextField.center.y -= 1000
        }, completion: { _ in
        })
        
        
        UIView.animate(withDuration: 0.8,
                       delay: 0.4,
                       options: .curveEaseInOut,
                       animations: {
                        self.loginButton.center.y -= 1000
        }, completion: { _ in
        })
        
        
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


    
    @IBAction func textFieldEditing(_ textField: UITextField){
        if  ((passwordTextField.text?.count ?? 0) > 0) && loginTextField.text?.count ?? 0 > 0{
            return loginButton.isEnabled = true
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        loginTextField.becomeFirstResponder()
        self.loginTextField.becomeFirstResponder()
        loginTextField.text = UserSettings.userModel?.loginName
        textFieldCustom()
        buttonCustom()
        loginButton.isEnabled = false
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.loginButton.center.y = keyboardSize.width
                
            }
            
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.loginButton.center.y = 0
            
        }
        
    }
    
    @IBAction func logOut(segue: UIStoryboardSegue) {
        loginTextField.text = UserSettings.userModel?.loginName
        passwordTextField.text! = ""
        loginTextField.delegate = self
        loginTextField.becomeFirstResponder()
        loginButton.isEnabled = false

    }

}




