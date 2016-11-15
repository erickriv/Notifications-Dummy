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
    
    let switches = ["CAM", "Administración de Empresas", "Biología", "Ciencias de Cómputos", "Ciencias Sociales",
        "Comunicación Tele-Radial", "Educación", "Enfermería", "Español", "Física-Química", "Humanidades",
        "Inglés", "Matemáticas", "Sistemas de Oficina"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mySwitch?.addTarget(self, action: #selector(notification_switchTableViewController.switchIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return switches.count
    }
    
    override func tableView (_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel!.text = switches[indexPath.row]
        
        // sets font style and size to respective devices (phone or pad)
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            cell.textLabel!.font = UIFont(name: "Arial", size: 19)
        }
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            cell.textLabel!.font = UIFont(name: "Arial", size: 25)
        }
        return cell
        
    }

    @IBAction func switchIsChanged(mySwitch: UISwitch) {
        
        if mySwitch.on {
            print("UISwitch is ON")
        } else {
            print("UISwitch is OFF")
        }
        
    }
}
