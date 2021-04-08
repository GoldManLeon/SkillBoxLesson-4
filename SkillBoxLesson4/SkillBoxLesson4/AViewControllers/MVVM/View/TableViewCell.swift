//
//  CellViewModel.swift
//  Test
//
//  Created by Левон on 05.04.2021.
//

import UIKit
class MVVMATableViewCell: UITableViewCell{
    @IBOutlet weak var label: UILabel!
    var viewModel: CellViewModelDelegate?{
        didSet(viewModel){
            self.label.text = viewModel?.name
        }
    }
}
