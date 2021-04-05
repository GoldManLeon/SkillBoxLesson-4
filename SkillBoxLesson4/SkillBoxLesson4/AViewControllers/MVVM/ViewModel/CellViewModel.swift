//
//  CellViewModel.swift
//  SkillBoxLesson4
//
//  Created by Левон on 05.04.2021.
//

import Foundation

class MVVMACellViewModel: CellViewModelDelegate{
    
    var viewModel: Model
    
    var name: String{
        return viewModel.name
    }
    
    init(viewModel: Model){
        self.viewModel = viewModel
    }

    
}
