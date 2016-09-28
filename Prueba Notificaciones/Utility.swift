//
//  Utility.swift
//  Pregunta Lobo First Prototype
//
//  Created by Amaury Rodriguez on 10/20/15.
//  Copyright © 2015 Cheylianie Rivera. All rights reserved.
//

import UIKit

//Clase para verificar si la base de datos existe.
class Utility: NSObject {
    
    func getPath(fileName: String) -> String {
        print(NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] + "/" + fileName)
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] + "/" + fileName
    }
    
    func copyFile(fileName: NSString) {
        let dbPath: String = getPath(fileName as String)
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(dbPath) {
            let fromPath: String? = (NSBundle.mainBundle().resourcePath)! + "/" + (fileName as String)
            var error : NSError?
            do {
                try fileManager.copyItemAtPath(fromPath!, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            let alert: UIAlertView = UIAlertView()
            if (error != nil) {
                alert.title = "Error."
                alert.message = error?.localizedDescription
            } else {
                alert.title = "Pregunta Lobo"
                alert.message = "Your database copy successfully"
            }
            alert.delegate = nil
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    
}