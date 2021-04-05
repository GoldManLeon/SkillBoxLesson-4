
import UIKit
class MVVMAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var viewModel: ViewModelDelegate?
    var nameOfViewModel: ViewModel?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = ViewModel()
        nameOfViewModel?.setLabelsForData{ (result) in
            self.nameViewModel?.name = result
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForMVVMA", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell()}
        tableViewCell.viewModel = viewModel.cellViewModel(for: indexPath)
        return tableViewCell
    }
    
}
