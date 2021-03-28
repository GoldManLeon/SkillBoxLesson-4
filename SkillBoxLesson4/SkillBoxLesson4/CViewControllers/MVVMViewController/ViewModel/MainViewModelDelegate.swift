//
//  MainViewModelDelegate.swift
//  SkillBoxLesson4
//
//  Created by Левон on 28.03.2021.
//

import Foundation

protocol MainViewModelDelegate: class{
    func plusButtonChange(viewModel: MainViewModelProtocol )
    func minusButtonChange(viewModel: MainViewModelProtocol )
    func changeButtonChange(viewModel: MainViewModelProtocol )
    func textLabelChange(viewModel: MainViewModelDelegate)
}
