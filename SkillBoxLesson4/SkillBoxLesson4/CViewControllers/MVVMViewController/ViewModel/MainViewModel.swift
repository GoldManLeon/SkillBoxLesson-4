//
//  MainViewModel.swift
//  SkillBoxLesson4
//
//  Created by Левон on 28.03.2021.
//

import Foundation

class MainViewModel: MainViewModelProtocol{
   
    
    var plusDelegate: MainViewModelDelegate?

    var minusDelegate: MainViewModelDelegate?

    var changeDelegate: MainViewModelDelegate?
    
    var textLabelDelegate: MainViewModelDelegate?

    
    
    var plusText: String?{
        didSet{
            plusDelegate?.plusButtonChange(viewModel: self)
        }
    }

    var minusText: String?{
        didSet{
            minusDelegate?.minusButtonChange(viewModel: self)
        }
    }

    var changeText: String?{
        didSet{
            changeDelegate?.changeButtonChange(viewModel: self)
        }
    }
    
    var textLabel: String?{
        didSet{
            textLabelDelegate?.textLabelChange(viewModel: self)
        }
    }
    
    
    let textPlusDelegate: MainPluseModelDelegate
    let textMinusDelegate: MainMinusModelDelegate
    let textChangeDelegate: MainChangeModelDelegate
    let textlabelDelegate: MainLabelModelDelegate

    init(textPlusDelegate: MainPluseModelDelegate){
        self.textPlusDelegate = textPlusDelegate
    }

    init(textMinusDelegate: MainMinusModelDelegate){
        self.textMinusDelegate = textMinusDelegate
    }

    init(textChangeDelegate: MainChangeModelDelegate){
        self.textChangeDelegate = textChangeDelegate
    }

    init(textlabelDelegate: MainLabelModelDelegate){
        self.textlabelDelegate = textlabelDelegate
    }
    
    func plusButtonClicked() {
        
        plusDelegate?.plusButtonChange(viewModel: self)
    }

    func minusButtonClicked() {
        plusDelegate?.minusButtonChange(viewModel: self)
    }

    func changeButtonClicked() {
        changeDelegate?.changeButtonChange(viewModel: self)
    }
    
    func textLabelShared() {
        textLabelDelegate?.textLabelChange(viewModel: self)
    }
    
}
