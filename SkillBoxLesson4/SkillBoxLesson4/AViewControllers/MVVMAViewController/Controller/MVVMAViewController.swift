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
        viewModel.getData{ (_) in
            DispatchQueue.main.async {
                [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) else { return UITableViewCell()}
        let selectedIndexPath = viewModel.cellViewModel(for: indexPath.row)
        cell.textLabel?.text = "\(selectedIndexPath!.name)"
        return cell
    }
}
