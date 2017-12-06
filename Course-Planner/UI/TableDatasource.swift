//
//  TableDatasource.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/6/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

typealias TableCellCallback = (UITableView, IndexPath) -> UITableViewCell

class TableViewDataSource<Item> : NSObject, UITableViewDataSource
{
    var items : [Item]
    
    var configureCell: TableCellCallback?
    
    init(items: [Item])
    {
        self.items = items
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configureCell = configureCell else {
            precondition(false, "You did not pass a configuration closure to configure cell, you must do so")
        }
        
        return configureCell(tableView, indexPath)
    }
}
