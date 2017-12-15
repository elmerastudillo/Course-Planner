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
    let dataSource = TableViewDataSource(items: [Session]())
    
    var course : Course?
    var sessions : [Session]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sessions = course?.session?.allObjects as? [Session]
        dataSource.items = self.sessions!
        self.sessionTableView.dataSource = dataSource
        
        // Do any additional setup after loading the view.
        dataSource.configureCell = { (tableview, indexpath) -> UITableViewCell in
            let session = self.sessions![indexpath.row]
            let cell = tableview.dequeueReusableCell(withIdentifier: "sessionCell")
            cell?.textLabel?.text = session.name
            cell?.detailTextLabel?.text = session.date
            return cell!
        }
        
        self.sessionTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addSessionWasPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let addSessionVC = storyboard.instantiateViewController(withIdentifier: "AddSessionViewController") as! AddSessionViewController
        addSessionVC.course = self.course
        self.navigationController?.pushViewController(addSessionVC, animated: true)
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

extension SessionsViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sessions = course?.session?.allObjects as! [Session]
        let session = sessions[indexPath.row]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let notesVC = storyboard.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
        notesVC.session = session
        self.navigationController?.pushViewController(notesVC, animated: true)
    }
}
