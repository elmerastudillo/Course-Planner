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
    let dataSource = TableViewDataSource(items: [Project]())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let projects = course?.projects?.allObjects as? [Project]
        dataSource.items = projects!
        projectsTableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let project = projects![indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell")
            cell?.textLabel?.text = project.name
            cell?.detailTextLabel?.text = project.due_date
            return cell!
        }
        
        self.projectsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addProjectButtonPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let addProjectVC = storyboard.instantiateViewController(withIdentifier: "AddProjectViewController") as! AddProjectViewController
        addProjectVC.course = course
        self.navigationController?.pushViewController(addProjectVC, animated: true)
        
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
