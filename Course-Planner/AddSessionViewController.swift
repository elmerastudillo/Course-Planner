//
//  addSessionViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class AddSessionViewController: UIViewController {
    
    let stack = CoreDataStack.instance

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    var course : Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addSessionWasPressed(_ sender: UIButton) {
        guard let nameText = nameTextField.text,
            let dateText = dateTextfield.text
            else {return}
        let session = Session(context: stack.viewContext)
        session.name = nameText
        session.date = dateText
        course?.addToSession(session)
        stack.save(context: stack.viewContext)
        self.navigationController?.popViewController(animated: true)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let sessionVC = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController
        sessionVC.course = course
        self.navigationController?.popToViewController(sessionVC, animated: true)
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
