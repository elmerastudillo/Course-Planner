//
//  addProjectViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController {
    
    var course : Course?
    let stack = CoreDataStack.instance
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dueDateTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addProjectButtonPressed(_ sender: UIButton) {
        guard let name = nameTF.text,
            let dueDate = dueDateTF.text
            else {return}
        
        let project = Project(context: stack.viewContext)
        project.name = name
        project.due_date = dueDate
        project.completed = false
        course?.addToProjects(project)
        stack.save(context: stack.viewContext)
//        let storyboard = UIStoryboard(name: "Main", bundle:nil)
//        let projectVC = storyboard.instantiateViewController(withIdentifier: "ProjectsViewController") as! ProjectsViewController
//        projectVC.course = course
        self.navigationController?.popViewController(animated: true)
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
