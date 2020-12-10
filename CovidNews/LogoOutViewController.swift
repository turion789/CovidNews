//
//  LogoOutViewController.swift
//  CovidNews
//
//  Created by turion789 on 5.11.20.
//

import Foundation
import UIKit

var redirectionLogo = ""
var notificationMinut:Int = 0
var notificationHour:Int = 0
class LogoOutViewController: UIViewController{
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var customLogOut: UIButton!
    
    @IBOutlet weak var textfieldData: UITextField!
    let picker = UIDatePicker()
    let notificationsTypes = NSLocalizedString("Notification Covid-19", comment: "Local Notification Covid-19")
    let notifications = Notifications()
    @IBAction func notifications(_ sender: Any) {
        
        let notificationType = notificationsTypes
        
        
//        let alert = UIAlertController(title: "",
//                                      message: "After 5 seconds " + notificationType + " will appear",
//                                      preferredStyle: .alert)
        
//        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
//
//            self.notifications.scheduleNotification(notificationType: notificationType)
//        }
//
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
        self.notifications.scheduleNotification(notificationType: notificationType)
    }
    

    func custamButtonLogOut(){
        customLogOut.layer.cornerRadius = 11
        customLogOut.layer.masksToBounds = true
        customLogOut.layer.borderWidth = 2
        customLogOut.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationTime()
        custamButtonLogOut()
        userNameLable.text! = redirectionLogo
        
    }
    func notificationTime(){
        picker.datePickerMode = .time
    
        picker.preferredDatePickerStyle = .wheels
        let toobar = UIToolbar()
        let doneButoon = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePicker))
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelPicker))
      
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toobar.setItems([doneButoon, space ,cancelButton], animated: true)
        toobar.sizeToFit()
        textfieldData.inputView = picker
        textfieldData.inputAccessoryView = toobar

        textfieldData.backgroundColor = .systemPink
        textfieldData.translatesAutoresizingMaskIntoConstraints = false
    }
    @objc private func donePicker(){
        let dateFormatter = DateFormatter()   // помогает переобразовать в нужный тип дату
        //dateFormater.dateFormat = "dd/MM/yyyy"
        //dateFormater.locale = Locale(identifier: "ru_Ru")
        dateFormatter.timeStyle = .short
        let stringDate = dateFormatter.string(from: picker.date)

        let hourComponent = dateFormatter.calendar.component(.hour, from: picker.date)
        notificationHour = hourComponent
        
        let minuteComponent = dateFormatter.calendar.component(.minute, from: picker.date)
        notificationMinut = minuteComponent
        
        textfieldData.text = stringDate
        self.view.endEditing(true)
    }
    @objc private func cancelPicker(){
        self.view.endEditing(true)
    }
    
}


