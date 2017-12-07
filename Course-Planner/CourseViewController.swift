//
//  ViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/4/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit
import CoreData

class CourseViewController: UIViewController {
    @IBOutlet weak var courseTableView: UITableView!
    var datasource = TableViewDataSource(items: [String]())
    var courses : [Course]?
    let stack = CoreDataStack.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchFromCoreData()
        courseTableView.dataSource = datasource
        
        datasource.configureCell = { (tableview, indexpath) -> UITableViewCell in
            let cell = tableview.dequeueReusableCell(withIdentifier: "", for: indexpath)
            guard let allCourses = self.courses else {
                return cell
            }
            let course = allCourses[indexpath.row]
            cell.textLabel?.text = course.name
            return cell
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchFromCoreData()
    {
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        do {
            let fetchResult = try stack.privateContext.fetch(fetchRequest)
//            let course = Course(context: stack.viewContext)
            self.courses = fetchResult
            print(self.courses)
            DispatchQueue.main.async {
                self.courseTableView.reloadData()
            }
        } catch let error
        {
            print(error)
        }
        
    }
    
    @IBAction func addCourseButtonPressed(_ sender: UIBarButtonItem) {
        print("add course pressed")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addCourseVC = storyboard.instantiateViewController(withIdentifier: "AddCourseViewController")
        self.navigationController?.pushViewController(addCourseVC, animated: true)
    }
}

extension CourseViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let courses = self.courses else { return }
        let course = courses[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sessionsVC = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController
        sessionsVC.course = course
        self.navigationController?.pushViewController(sessionsVC, animated: true)
    }
}

