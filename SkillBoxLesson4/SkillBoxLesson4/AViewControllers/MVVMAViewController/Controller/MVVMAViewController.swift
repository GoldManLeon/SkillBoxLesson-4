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

    var viewModel: ViewModel?
    
    var modelDelegate: MainDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelDelegate = ViewModel() as! MainDelegate
        viewModel?.getAllModelData()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelDelegate?.numberOrRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell, let viewModel = modelDelegate else { return UITableViewCell()}
        tableViewCell.viewModel = viewModel.cellIndexPath(for: indexPath) as! CellViewModel
        return tableViewCell
    }
    

}


