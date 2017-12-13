//
//  AddCourseViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    let stack = CoreDataStack.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCourseButtonPressed(_ sender: UIButton) {
        guard let couseText = courseTextField.text,
            let dateText = dateTextField.text else
        {return}
        
        let course = Course(context: stack.viewContext)
        course.name = couseText
        course.times = dateText
        
        stack.save(context: stack.viewContext)
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
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
