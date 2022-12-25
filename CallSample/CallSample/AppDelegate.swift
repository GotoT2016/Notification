//
//  AppDelegate.swift
//  CallSample
//
//  Created by TakeshiGoto on 2022/12/25.
//

import Foundation
import NotificationCenter
import UIKit

class AppDelegate:NSObject,UIApplicationDelegate,UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NotificationManager.instance.requestPermission()
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
}
