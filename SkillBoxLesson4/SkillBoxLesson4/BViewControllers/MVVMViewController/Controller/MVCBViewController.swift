import UIKit
import RealmSwift

class MVCBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Variable

    var realm: Realm!

    var toDoList: Results<ToDoListItem>{
        get {return realm.objects(ToDoListItem.self)}
    }

    //MARK: TableView

    @IBOutlet weak var tableView: UITableView!

    //MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        tableView.delegate = self
        tableView.dataSource = self
    }

    //MARK: @IBAction for button

    @IBAction func addButton(_ sender: Any) {
        let alertVc = UIAlertController(title: "New toDo", message: "What do you want to do", preferredStyle: .alert)
        alertVc.addTextField{ (UITextField) in
    }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertVc.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) -> Void in
            let toDoItemTextField = (alertVc.textFields?.first)! as UITextField
            let newToDoListItem = ToDoListItem()
            newToDoListItem.name = toDoItemTextField.text!
            newToDoListItem.done = false
            try! self.realm.write({
                self.realm.add(newToDoListItem)
                self.tableView.insertRows(at: [IndexPath.init(row: self.toDoList.count-1, section: 0)], with: .automatic)})
        }
        alertVc.addAction(addAction)
        present(alertVc, animated: true, completion: nil)
    }

    //MARK: TableView

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoList[indexPath.row]
        try! self.realm.write({
            self.realm.delete(item)
        })
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellForB")
        let addText = toDoList[indexPath.row]
        cell.textLabel?.text = addText.name
        cell.accessoryType = addText.done == true ? .checkmark : .none
        return cell
        }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 }



