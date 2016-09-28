//
//  NotificationsDetailViewController.swift
//  Pregunta Lobo
//
//  Created by Alexander Rivera on 9/11/16.
//  Copyright © 2016 Cheylianie Rivera. All rights reserved.
//

import UIKit


class NotificationsDetailViewController: UIViewController {
    
    @IBOutlet var messageField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var personaEncargadaLabel: UILabel!
    
    var selectedNotification: Notifications! { // Esto dentro del corchete se llama un property observer, look it up nigger.
        didSet {
            navigationItem.title = "\(selectedNotification.title)'s Details"
        }
    }
    
    
    override func viewDidLoad() {
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        messageField.text = selectedNotification.message
        titleLabel.text   = selectedNotification.title
        sourceLabel.text  = selectedNotification.source
        personaEncargadaLabel.text = selectedNotification.source
        
        // Podemos poner mas informacion si es de quererse.
        
    }
    
}
