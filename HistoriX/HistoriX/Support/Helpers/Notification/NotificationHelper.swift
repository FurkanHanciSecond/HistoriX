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
            let center = UNUserNotificationCenter.current()
            let content = UNMutableNotificationContent()
            content.title = "Hey HistoriX User!"
            content.body = "Come and see what happened 😄"
            content.sound = UNNotificationSound.default
            var dateComponents = DateComponents()
            dateComponents.hour = 8
            dateComponents.minute = 30
            dateComponents.weekday = weekday
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
          //  let request = UNNotificationRequest(identifier: String(weekday), content: content, trigger: trigger)
            let request = UNNotificationRequest(identifier: String(weekday) , content: content, trigger: trigger)

            center.add(request) { (error) in
                if let error = error {
                    print("Notification Error: ", error)
                }
            }
        }
}
