
import UIKit
class MVVMAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var viewModel: ViewModelDelegate?
    var nameViewModel: ViewModel?
    var name: [String] = [ ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = ViewModel()
        nameViewModel?.setLabelsForData{ result in
            self.name = result
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell()}
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
}

