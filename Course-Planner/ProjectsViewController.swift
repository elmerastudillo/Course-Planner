//
//  ProjectsViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    @IBOutlet weak var projectsTableView: UITableView!
    var course: Course?
    let dataSource = TableViewDataSource(items: [String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let projects = course?.projects?.allObjects as? [Project]
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let project = projects![indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell")
            cell?.textLabel?.text = project.name
            cell?.detailTextLabel?.text = project.due_date
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
