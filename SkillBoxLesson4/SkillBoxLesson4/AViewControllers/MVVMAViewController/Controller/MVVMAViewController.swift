//
//  MVVMAViewController.swift
//  SkillBoxLesson4
//
//  Created by Левон on 31.03.2021.
//

import UIKit
import Alamofire

 class MVVMAViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

       @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vc = self
//        viewModel.getAllModelDataAf{ result in
//            self.viewModel.name = result
//            self.tableView.reloadData()
//
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.viewModel = viewModel.name[indexPath.row]
        return cell
    }
    
 }

