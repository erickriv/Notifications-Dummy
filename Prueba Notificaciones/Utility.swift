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
    
    func getPath(_ fileName: String) -> String {
        print(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/" + fileName)
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/" + fileName
    }
    
    func copyFile(_ fileName: NSString) {
        let dbPath: String = getPath(fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath) {
            let fromPath: String? = (Bundle.main.resourcePath)! + "/" + (fileName as String)
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath!, toPath: dbPath)
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
            alert.addButton(withTitle: "Ok")
            alert.show()
        }
    }
    
}
