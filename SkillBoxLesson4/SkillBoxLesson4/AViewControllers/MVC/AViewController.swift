import UIKit
import Alamofire

class AViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

     // MARK: - IBOutlet
     
     @IBOutlet weak var tableView: UITableView!

     // MARK: - Variable
     
    var name: [ String ] = [ ]

     // MARK: - Life Cycle
     
     override func viewDidLoad() {
         super.viewDidLoad()
         tableView.delegate = self
         tableView.dataSource = self
         setLabelsForData{ (result) in
         self.name = result
         self.tableView.reloadData()
        }
     }
    
    // MARK: - Set Data
    
    func setLabelsForData(categories: @escaping ([String]) -> (Void)){
       typealias categoriesData = [ String : MVCListModel]
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

    // MARK: - TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = name[indexPath.row]
        return cell
    }
 }
