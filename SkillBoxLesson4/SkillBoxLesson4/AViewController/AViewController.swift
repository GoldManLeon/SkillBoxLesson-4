//import UIKit
//class AViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
//
//    // MARK: - IBOutlets
//
//    @IBOutlet weak var tableView: UITableView!
//
//    // MARK: - Variables, Constant
//
//    var categories = [Categories]()
//    var categoriesArray = [Categories]()
//
//    // MARK: - Life Cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        downloadJson{(result) in
//        self.categoriesArray = result
//            self.tableView.reloadData()
//        }
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//
//    // MARK: - Func for tableView realization
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForA")!
//        cell.textLabel!.text = categories[indexPath.row].name
//        return cell
//    }
//
//    // MARK: - Download Json File
//
//    func downloadJson(_ completition: @escaping ([Categories]) -> Void){
//        guard let url = URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories") else {return}
//            let request = URLRequest(url: url)
//                let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
//                    if let data = data,
//                       let json = try? JSONSerialization.jsonObject(with: data,
//                                                                    options:JSONSerialization.ReadingOptions.allowFragments),
//                             let jsonDict = json as? [String:Any]{
//                                 var allCategory: [Categories] = []
//                                     if let list = jsonDict["67"] as? [[String:Any]]{
//                                        for dict in list{
//                                            let allCategoryData = Categories(data: dict)
//                                                allCategory.append(allCategoryData!)}
//                                                    DispatchQueue.main.async {
//                                                         completition(allCategory)
//                    }
//                }
//            }
//        };task.resume()
//    }
//
//    // MARK: - Category
//
//class Categories{
//    var name: String = ""
//        init?(data:[String: Any]){
//             if let nameResult = data["name"] as? String{
//                    self.name = nameResult
//                }
//            }
//        }
//    }
//
//
