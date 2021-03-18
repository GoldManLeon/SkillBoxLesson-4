import UIKit


class ATestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variable
    
    var main = [BlackStarMain]()
    var firstEntry: BlackStarFirstEntry?
    var secondEntry = [BlackStarSecondEntry]()
    var thirdEntry = [BlackStarThirdEntry]()
    var fourEntry = [BlackStarFourEntry]()
    var fiveEntry = [BlackStarFiveEntry]()
    var sixEntry = [BlackStarSixEntry]()
    var sevenEntry = [BlackStarSevenEntry]()
    var eightEntry = [BlackStarEightEntry]()
    var nineEntry = [BlackStarNineEntry]()
    var tenEntry = [BlackStarTenEntry]()
    var elevenEntry = [BlackStarElevenEntry]()
    var twelfEntry = [BlackStarTwelfEntry]()
    
    // MARK: - Life Cycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setLabelsForData()
    }
        
    func setLabelsForData(){
        let url = "https://blackstarshop.ru/index.php?route=api/v1/categories"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else { print("ERROR SOMETHING WENT WRONG")
                return
            }
            
            var json: BlackStarMain?
            
            do{
                json = try JSONDecoder().decode(BlackStarMain.self, from: data)
            } catch {
                print("Error, \(error)")
            }
                
            guard let result = json else {
                return
            }
            
            let entryFirst = result.first
            let entrySecond = result.second
            let entryThird = result.third
            let entryFour = result.four
            let entryFive = result.five
            let entrySix = result.six
            let entrySeven = result.seven
            let entryEight = result.eight
            let entryNine = result.nine
            let entryTen = result.ten
            let entryEleven = result.eleven
            let entryTwelf = result.twelf
            
            self.firstEntry.append(contentsOf: entryFirst)
            self.secondEntry.append(contentsOf: entrySecond)
            self.thirdEntry.append(contentsOf: entryThird)
            self.fourEntry.append(contentsOf: entryFour)
            self.fiveEntry.append(contentsOf: entryFive)
            self.sixEntry.append(contentsOf: entrySix)
            self.sevenEntry.append(contentsOf: entrySeven)
            self.eightEntry.append(contentsOf: entryEight)
            self.nineEntry.append(contentsOf: entryNine)
            self.tenEntry.append(contentsOf: entryTen)
            self.elevenEntry.append(contentsOf: entryEleven)
            self.twelfEntry.append(contentsOf: entryTwelf)
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).resume()
        
        
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return main.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.label.text  = main[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


class BlackStarMain: Decodable{
    let first: [String:Any] = ["263": [BlackStarFirstEntry].self]
    let second: [String:Any] = ["67": [BlackStarSecondEntry].self]
    let third: [String:Any] = ["68": [BlackStarSecondEntry].self]
    let four: [String:Any] = ["69": [BlackStarFourEntry].self]
    let five: [String:Any] = ["73": [BlackStarFiveEntry].self]
    let six: [String:Any] = ["74": [BlackStarSixEntry].self]
    let seven: [String:Any] = ["75": [BlackStarSevenEntry].self]
    let eight: [String:Any] = ["123": [BlackStarEightEntry].self]
    let nine: [String:Any] = ["156": [BlackStarNineEntry].self]
    let ten: [String:Any] = ["165": [BlackStarTenEntry].self]
    let eleven: [String:Any] = ["233": [BlackStarElevenEntry].self]
    let twelf: [String:Any] = ["0": [BlackStarTwelfEntry].self]
}

class BlackStarFirstEntry: Decodable{
    let name: String
}
class BlackStarSecondEntry: Decodable{
    let name: String
}
class BlackStarThirdEntry: Decodable{
    let name: String
}
class BlackStarFourEntry: Decodable{
    let name: String
}
class BlackStarFiveEntry: Decodable{
    let name: String
}
class BlackStarSixEntry: Decodable{
    let name: String
}
class BlackStarSevenEntry: Decodable{
    let name: String
}
class BlackStarEightEntry: Decodable{
    let name: String
}
class BlackStarNineEntry: Decodable{
    let name: String
}
class BlackStarTenEntry: Decodable{
    let name: String
}

class BlackStarElevenEntry: Decodable{
    let name: String
}

class BlackStarTwelfEntry: Decodable{
    let name: String
}

