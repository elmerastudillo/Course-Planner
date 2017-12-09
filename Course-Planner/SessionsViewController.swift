//
//  SessionsViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import CoreData

class SessionsViewController: UIViewController {
    
    @IBOutlet weak var sessionTableView: UITableView!
    let stack = CoreDataStack.instance
    let dataSource = TableViewDataSource(items: [String]())
    
    var course : Course?
    var sessions : [Session]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sessions = course?.session?.allObjects as? [Session]
        
        // Do any additional setup after loading the view.
        dataSource.configureCell = { (tableview, indexpath) -> UITableViewCell in
            let session = self.sessions![indexpath.row]
            let cell = tableview.dequeueReusableCell(withIdentifier: "sessionCell")
            cell?.textLabel?.text = session.name
            cell?.detailTextLabel?.text = session.date
            return cell!
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
