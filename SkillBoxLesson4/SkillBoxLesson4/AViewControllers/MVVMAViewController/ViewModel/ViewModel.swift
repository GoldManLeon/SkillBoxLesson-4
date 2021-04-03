//
//  ViewModel.swift
//  SkillBoxLesson4
//
//  Created by Левон on 31.03.2021.
//

import Foundation
import Alamofire

class ViewModel: ViewModelDelegate{
    
    var viewModel = [Model]()
    var jsonData: JsonData?

    func getData(complition: @escaping ([Model]) -> ()){
        jsonData?.setLabelsForData{ (complitionData) in
            self.viewModel = complitionData
            complition(complitionData)
        }
    }
        
    func numberOfRows() -> Int {
        return viewModel.count
    }
    
    func cellViewModel(for indexPath: Int) -> Model? {
        return viewModel[indexPath]
    }
    
    
}

