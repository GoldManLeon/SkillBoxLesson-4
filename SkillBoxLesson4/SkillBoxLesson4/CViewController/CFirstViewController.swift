//
//  CViewController.swift
//  SkillBoxLesson 4
//
//  Created by Левон on 06.03.2021.
//

import UIKit

class CFirstViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!

    // MARK: - Variables, Constants

    var number = 0
    private var cs: CSecondViewController?
    var text = ""

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupIBActions()
    }

    // MARK: - Prepare

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ct = segue.destination as? CThirdViewController, segue.identifier == "ct"{
            ct.delegate = self
                ct.text = numberLabel.text!
            numberLabel.text = "\(number)"
        }
    }

    // MARK: - IBActions

    @IBAction func addButtonAction(_ sender: Any){
        guard let cs = storyboard?.instantiateViewController(identifier: "cs") as? CSecondViewController else {return}
                navigationController?.pushViewController(cs, animated: true)
                number = number + 1
            numberLabel.text = "\(number)"
        cs.textForLabel = numberLabel.text!
    }

    @IBAction func minusButtonAction(_ sender: Any){
        guard let cs = storyboard?.instantiateViewController(identifier: "cs") as? CSecondViewController else {return}
               navigationController?.pushViewController(cs, animated: true)
               number = number - 1
            numberLabel.text = "\(number)"
        cs.textForLabel = numberLabel.text!
    }

    // MARK: - Func for setup

    func setupIBActions(){
        addButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        changeButton.layer.cornerRadius = 10
    }
}

// MARK: - Extension

extension CFirstViewController: TextFieldDelegate{
    func bindText(bind: String) {
        self.text = bind
        numberLabel.text  = bind
    }
}

