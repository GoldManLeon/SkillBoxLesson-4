//
//  TableViewCell.swift
//  SkillBoxLesson4
//
//  Created by Левон on 31.03.2021.
//

import UIKit

class TableViewCell: UITableViewCell{
    
    @IBOutlet weak var label: UILabel!
    
    var viewModel: Model?{
        didSet{
            modelConfiguration()
        }
    }
    
    func modelConfiguration(){
        if let name = viewModel?.name{
            label.text = name
        } else {
            label.text = "No text"
        }
    }
}
