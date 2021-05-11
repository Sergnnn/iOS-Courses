//
//  TodoCell.swift
//  ToDo App
//
//  Created by Сергей Непомящий on 26.01.2021.
//

import UIKit

class TodoCell: UITableViewCell {
    
    
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    func updateCell(todo: Todo){
        itemLbl.text = todo.item
        
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            break
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            break
        default:
        priorityView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }

}
