//
//  AppDelegate.swift
//  CovidNews
//
//  Created by turion789 on 4.11.20.
//

import UIKit
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    func requestAutorization(){
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else {return}
            self.getNotificationSetting()
        }
    }
    
    
    func getNotificationSetting(){
        notificationCenter.getNotificationSettings { (settings) in
            print(settings)
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let actionIdentifier = response.actionIdentifier
        let content = response.notification.request.content
         
        switch actionIdentifier {
        case UNNotificationDismissActionIdentifier: // Notification was dismissed by user
            // Do something
            completionHandler()
        case UNNotificationDefaultActionIdentifier: // App was opened from notification
            // Do something
            completionHandler()
        case "com.usernotificationstutorial.reply":
            if let textResponse = response as? UNTextInputNotificationResponse {
                let reply = textResponse.userText
                // Send reply message
                completionHandler()
            }
        case "com.usernotificationstutorial.delete":
            // Delete message
            completionHandler()
        default:
            completionHandler()
        }
    }
    
    func scheduleNotification(notificationType: String){
    
        
        
//        let center = UNUserNotificationCenter.current()
//
//            let content = UNMutableNotificationContent()
//            content.title = "Late wake up call"
//            content.body = "The early bird catches the worm, but the second mouse gets the cheese."
//            content.categoryIdentifier = "alarm"
//            content.userInfo = ["customData": "fizzbuzz"]
//            content.sound = UNNotificationSound.default
//
//            var dateComponents = DateComponents()
//            dateComponents.hour = 10
//            dateComponents.minute = 30
//       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//           // let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//            //center.add(request)
//
//        let date = Date(timeIntervalSinceNow: 3600)
//        let triggerWeekly = Calendar.current.dateComponents([.hour, .minute, .second,], from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
//
//
//        let identifier = "Local Notification"
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        notificationCenter.add(request) { (error) in
//            if let error = error {
//                print("Error \(error.localizedDescription)")
//            }
//        }
//        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
//        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
//        let userActions = "User Actions"
//        let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
//        notificationCenter.setNotificationCategories([category])
//        content.categoryIdentifier = userActions
        
        // 1
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 2
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // 2
        let content = UNMutableNotificationContent()
        content.title = "Daily reminder"
        content.body = "Enjoy your day!"

        let randomIdentifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: randomIdentifier, content: content, trigger: trigger)

        // 3
        UNUserNotificationCenter.current().add(request) { error in
          if error != nil {
            print("something went wrong")
          }
        }
        
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        requestAutorization()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }


}

