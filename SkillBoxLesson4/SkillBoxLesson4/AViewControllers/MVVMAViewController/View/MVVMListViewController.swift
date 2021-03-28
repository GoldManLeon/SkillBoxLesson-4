
import UIKit
class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables

    var viewModel = ListViewModel()
    var name: [String] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getListData{ (result) in
            self.name = result
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = name[indexPath.row]
        return cell
   }
}
