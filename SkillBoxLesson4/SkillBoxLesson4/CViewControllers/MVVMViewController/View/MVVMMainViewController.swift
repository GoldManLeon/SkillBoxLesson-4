//
//  MainViewController.swift
//  Test
//
//  Created by Левон on 28.03.2021.
//

import UIKit

class MVVMMainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
   
    // MARK: - Constant
    
    let viewModel: MainViewModelProtocol
    
    // MARK: - Initialization
    
    init(viewModel: MainViewModelProtocol ){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBActions
    
    @IBAction func plusButtonAction(sender: Any){
        viewModel.plusButtonClicked()
    }
    
    @IBAction func minusButtonAction(sender: Any){
        viewModel.minusButtonClicked()
    }

    @IBAction func changeButtonAction(sender: Any){
        viewModel.changeButtonClicked()
    }

    
}
