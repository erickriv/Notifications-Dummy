//
//  AppDelegate.swift
//  Prueba Notificaciones
//
//  Created by Erick Rivera on 8/24/16.
//  Copyright © 2016 Erick Rivera. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Appearance colors
        UITabBar.appearance().barTintColor = UIColor.yellowColor()
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // function that prompts user to accept or decline to receive notifications
    // it'll also be used when the app first launches
    func registerForNotifications (applications : UIApplication) {
        
        // creamos una constante de la configuracion para que sea siempre igual
        let notificationSettings = UIUserNotificationSettings (forTypes: [.Badge, .Sound, .Alert], categories: nil)
        
        applications.registerUserNotificationSettings(notificationSettings)
        
    }
    
    // function used when the user accepts notifications from the app it'll register for Remote Notifications
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings:
        UIUserNotificationSettings) {
        
            if notificationSettings.types != .None {
                
                application.registerForRemoteNotifications()
            }
            
    }
    
    // function designed for if the user registered for remote notifications then it generates a device token
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        // creamos una constante del token que recibamos como constant character
        let tokenChar = UnsafePointer<CChar>(deviceToken.bytes)
        
        // se guarda el device token generado
        var tokenStr = " "
        
        // por cada caracter del token que identifica el device le cambiamos el formato para no tener info personal
        for i in 0..<deviceToken.length {
            
            tokenStr += String(format: "%02.2hhx", arguments: [tokenChar[i]])
        }
        
        print("Device Token", tokenStr)
    }
    
    // function unlike the one above, its used when the user didnt signed for remote notifications
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
        // the output is an error
        print("Fail to register: ", error)
    }
    


}

