//
//  CSecondViewController.swift
//  SkillBoxLesson 4
//
//  Created by Левон on 06.03.2021.
//

import UIKit

// MARK: - Protocol

protocol LabelTextDelegate{
    func bindLabel(label: String)
}

class CSecondViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var numberLabelForSecondViewController: UILabel!

    // MARK: - Variables

    var textForLabel = ""
    var delegate: LabelTextDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabelForSecondViewController.text = textForLabel
    }

    // MARK: - IBAcition

    @IBAction func closeButton(_ sender: Any){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}


