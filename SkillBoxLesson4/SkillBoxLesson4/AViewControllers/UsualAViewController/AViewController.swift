import UIKit
import Alamofire


 class AViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

     // MARK: - IBOutlet
     
     @IBOutlet weak var tableView: UITableView!

     // MARK: - Variable
     
     var nameLabelVariable = ""

     // MARK: - Life Cycle
     
     override func viewDidLoad() {
         super.viewDidLoad()
         tableView.delegate = self
         tableView.dataSource = self
         setLabelsForData()
     }
    
    // MARK: - Set Data
    
    func setLabelsForData(){
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON{response in
            if let responseData = response.value as? [String:Any] {
                if let dict = responseData["67"] as? [String:Any]{
                    if let name = dict["name"] as? String{
                        self.nameLabelVariable = name
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
        return nameLabelVariable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.label.text = nameLabelVariable
        return cell
    }
 }
