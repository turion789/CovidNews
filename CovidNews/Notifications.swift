
import Foundation
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func userRequest() {
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print(NSLocalizedString("User has declined notifications", comment: "User has declined notifications"))
            }
        }
    }
    
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent() // Содержимое уведомления
        content.title = notificationType
        content.body = NSLocalizedString("Statistics Updated", comment: "Statistics Updated")
        content.sound = UNNotificationSound.default
        content.badge = 1

        let date = Date(timeIntervalSinceNow: 3600)
        var triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
        triggerDaily.hour = notificationHour
        triggerDaily.minute = notificationMinut
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        let identifier = "Notification Covid-19"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
//        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
//        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
//        let category = UNNotificationCategory(identifier: userActions,
//                                              actions: [snoozeAction, deleteAction],
//                                              intentIdentifiers: [],
//                                              options: [])
//
//        notificationCenter.setNotificationCategories([category])
    }
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//
//        completionHandler([.banner,.sound])
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                didReceive response: UNNotificationResponse,
//                                withCompletionHandler completionHandler: @escaping () -> Void) {
//
//        switch response.actionIdentifier {
//        case UNNotificationDismissActionIdentifier:
//            print("Dismiss Action")
//        case UNNotificationDefaultActionIdentifier:
//            print("Default")
//        case "Snooze":
//            print("Snooze")
//            scheduleNotification(notificationType: "sdfd")
//        case "Delete":
//            print("Delete")
//        default:
//            print("Unknown action")
//        }
//        completionHandler()
//    }
}
