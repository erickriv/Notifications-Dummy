

import Foundation
import UIKit

class NotificationsTableViewController: UITableViewController {
    
    let notifications = Notifications()
    var selectedNotification = Notifications()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65 // Por ahora, no se pq exactamente uso esto en todos los proyectos
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        notifications.loadTempNotifications() // Hacemos un refresh de la info sacada de la db
        tableView.reloadData() // Se haga refresh de la data que se presenta en la tablas
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedNotification = notifications.tempNotifications[indexPath.row]
        self.performSegueWithIdentifier("notificationsDetailSegue", sender: self)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Funcion: Demostramos la data del cell, dependiendo de su posicion en el SourceData
        
        let cell = tableView.dequeueReusableCellWithIdentifier("notificationsViewCell", forIndexPath: indexPath) as! NotificationsCell
        let viewableNotification = notifications.tempNotifications[indexPath.row]
        
        cell.titleLabel.text = viewableNotification.title
        cell.sourceNameLabel.text = viewableNotification.source
        
        
        return cell
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "notificationsDetailSegue"){
            
            // Ahora buscamos la notificacion especifica
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let notification = notifications.tempNotifications[row]
                let detailViewController = segue.destinationViewController as! NotificationsDetailViewController
                
                detailViewController.selectedNotification = notification
            }
        }
    }
     
}


        