//
//  NotificationService.swift
//  TestingBackend
//
//  Created by Akhil Maheepathi on 10/15/22.
//

import Foundation
import UIKit
import UserNotifications

class NotificationService: NSObject, UNUserNotificationCenterDelegate, ObservableObject{
    override init(){
        super.init()
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options:[.alert, .sound]) { (granted, error) in
                if let error = error{
                    print(error)
                } else if granted {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            }
    }
    
    //Foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void){
        logContents(of: notification)
        completionHandler([.banner, .sound])
        }
    
    
    //Background
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        logContents(of: response.notification)
            completionHandler()
    }
    
    func logContents(of notification: UNNotification) {
        print(notification.request.content.userInfo)
    }
}
