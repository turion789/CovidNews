//
//  NotificationViewController.swift
//  UserNotificationsLocal
//
//  Created by Vlad Steshik on 3.12.20.
//

import UIKit
import UserNotifications
import UserNotificationsUI



class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
