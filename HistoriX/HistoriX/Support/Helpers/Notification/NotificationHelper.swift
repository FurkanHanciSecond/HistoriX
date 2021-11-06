//
//  NotificationHelper.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/29/21.
//

import UserNotifications
import UIKit


class NotificationHelper  {
    static let shared = NotificationHelper()
    
    private init() {}
    
    func requestForPermission() -> Void {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert , .badge , .sound]) { granted, err in
            switch granted {
            case .BooleanLiteralType(true):
                self.setWeekdayReminder(weekday: 3)
                print("accepted")
                
            case .BooleanLiteralType(false):
                print("not accepted :/")
                
            default:
            break;
            }
            
          
            
        }
    }
    
    func setWeekdayReminder(weekday: Int) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = Constants.Notification.title
        notificationContent.body = Constants.Notification.body
        notificationContent.badge = NSNumber(value: 1)
        notificationContent.sound = .defaultCritical
                        
        var datComp = DateComponents()
        datComp.hour = 8
        datComp.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
        let request = UNNotificationRequest(identifier: Constants.Notification.id, content: notificationContent, trigger: trigger)
                        UNUserNotificationCenter.current().add(request) { (error : Error?) in
                            if let theError = error {
                                print(theError.localizedDescription)
                            }
                        }
}

}
