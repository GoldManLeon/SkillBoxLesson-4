//
//  MVCAViewController.swift
//  SkillBoxLesson4
//
//  Created by Левон on 23.03.2021.
//


import UIKit
import Alamofire

class MVCAViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var model: [BlackStarModel]!
    
    var name = ""
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = [ BlackStarModel(name: name)]
        tableView.delegate = self
        tableView.dataSource = self
        setLabelsForData()
    }
    
    // MARK: - Set Label
    
    func setLabelsForData(){
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON{response in
            if let responseData = response.value as? [String:Any] {
                if let dict = responseData["67"] as? [String:Any]{
                    if let name = dict["name"] as? String{
                        self.name = name
                           DispatchQueue.main.async {
                              self.tableView.reloadData()
                       }
                    }
                }
            }
        }
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let models = model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = "\(models.name)"
        return cell
    }
}
