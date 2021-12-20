//
//  NotificationHandler.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 15.12.2021.
//

import Foundation
import UserNotifications

class NotificationHandler{
//Permission function
func askNotificationPermission(completion: @escaping ()->Void){
    
    //Permission to send notifications
    let center = UNUserNotificationCenter.current()
    // Request permission to display alerts and play sounds.
    center.requestAuthorization(options: [.alert, .badge, .sound])
    { (granted, error) in
        // Enable or disable features based on authorization.
        completion()
        }
    }
}
