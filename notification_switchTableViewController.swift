//
//  notification_switchTableViewController.swift
//  Prueba Notificaciones
//
//  Created by Erick Rivera on 8/24/16.
//  Copyright © 2016 Erick Rivera. All rights reserved.
//

import UIKit

class notification_switchTableViewController: UITableViewController {
    
    @IBOutlet var mySwitch: UISwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch?.addTarget(self, action: #selector(notification_switchTableViewController.switchIsChanged(_:)), for: UIControlEvents.valueChanged)
    }


    @IBAction func switchIsChanged(_ mySwitch: UISwitch) {
        if mySwitch.isOn {
            print("UISwitch is ON")
        } else {
            print("UISwitch is OFF")
        }
        
    }
    
    
}
