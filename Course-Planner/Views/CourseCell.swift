//
//  CourseCell.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/12/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var projectsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
