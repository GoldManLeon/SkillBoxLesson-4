//
//  ViewModel.swift
//  SkillBoxLesson4
//
//  Created by Левон on 31.03.2021.
//

import UIKit
import Alamofire

class ViewModel{

    weak var vc: ViewController?
    
    var name = [Model]()
    
    func getAllModelDataAf(categories: @escaping ([String]) -> (Void)){
        typealias categoriesData = [ String : Model]
        var categoriesName: [ String ] = [ ]
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseDecodable(of: categoriesData.self){response in
            if let responseData = response.value{
                           DispatchQueue.main.async {
                            for val in responseData{
                                categoriesName.append(val.value.name!)
                        }
                            categories(categoriesName)
                    }
                }
            }
        }
    
    func getAllModelData(){
        URLSession.shared.dataTask(with: URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories")!){ (data, response, error ) in
            if let data = data, error == nil {
                do{
                    let userResponse = try JSONDecoder().decode([Model].self, from: data)
                    self.name.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tableView.reloadData()
                    }
                } catch let err{
                    print(err.localizedDescription)
                }
            } else {
                print(error?.localizedDescription)
          }
       }.resume()
    }
 }
