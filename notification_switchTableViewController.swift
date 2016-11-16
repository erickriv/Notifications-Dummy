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
        
        mySwitch?.addTarget(self, action: #selector(notification_switchTableViewController.switchIsChanged(_:)), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }*/
    
    override func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel!.text = switches[(indexPath as NSIndexPath).row]
        
        // sets font style and size to respective devices (phone or pad)
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            cell.textLabel!.font = UIFont(name: "Arial", size: 19)
        }
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            cell.textLabel!.font = UIFont(name: "Arial", size: 25)
        }
        
        //tableView.reloadData()
        return cell
        
    }

    @IBAction func switchIsChanged(_ mySwitch: UISwitch) {
        
        if mySwitch.isOn {
            
            //subscribe to selected topic
            print("UISwitch is ON")
            
            //FIRMessaging.messaging().subscribe(toTopic: "/topics/\(switches.row)")
            
        } else {
            
            //unsubscribe to topic
            print("UISwitch is OFF")
            //FIRMessaging.messaging().unsubscribe(toTopic: "/topics/\(switches.row)")
        }
        
    }
}
