
    import UIKit

    // MARK: - Protocol

    protocol TextFieldDelegate{
        func bindText(bind: String)
    }

class CThirdViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Variables

    var delegate: TextFieldDelegate?
    var text = ""

    // Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = text
        
    }

    // MARK: - Touches ended

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IBAction

    @IBAction func save(_ sender: Any){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        delegate?.bindText(bind: textField.text!)
    }
}
