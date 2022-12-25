//
//  NotificationManager.swift
//  CallSample
//
//  Created by TakeshiGoto on 2022/12/25.
//

import Foundation
import UserNotifications

final class NotificationManager{
    static let instance: NotificationManager = NotificationManager()
    
    // 権限リクエスト
    func requestPermission(){
        UNUserNotificationCenter.current()
            .requestAuthorization(options:[.alert,.sound,.badge]){(granted,_) in print("Permission granted: \(granted)")}
    }
    
    // notificationの登録
    func sendNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "Local Notification Test"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request,withCompletionHandler: nil)
    }
}
