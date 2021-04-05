
import Foundation
import Alamofire
class MVVMAViewModel: ViewModelDelegate{
    
     func setLabelsForData(categories: @escaping ([String]) -> (Void)){
       typealias categoriesData = [ String : Model]
       var categoriesName: [ String ] = [ ]
       AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseDecodable(of: categoriesData.self){response in
           if let responseData = response.value{
                          DispatchQueue.main.async {
                           for val in responseData{
                               categoriesName.append(val.value.name)
                       }
                           categories(categoriesName)
                   }
               }
           }
       }
    
    var name: [Model] = [ ]
    
    func numberOfRows() -> Int {
        return name.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CellViewModelDelegate? {
        return CellViewModel(viewModel: name[indexPath.row])
    }
}
