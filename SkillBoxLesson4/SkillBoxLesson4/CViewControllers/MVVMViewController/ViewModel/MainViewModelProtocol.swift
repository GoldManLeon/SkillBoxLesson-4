//
//  MainViewModelProtocol.swift
//  SkillBoxLesson4
//
//  Created by Левон on 28.03.2021.
//

import Foundation

protocol MainViewModelProtocol{
    var plusDelegate: MainViewModelDelegate? { get }
    var minusDelegate: MainViewModelDelegate? { get }
    var changeDelegate: MainViewModelDelegate? { get }
    var textLabelDelegate: MainViewModelDelegate? { get }
    var plusText: String? { get }
    var minusText: String? { get }
    var changeText: String? { get }
    var textLabel: String? { get }
    func plusButtonClicked()
    func minusButtonClicked()
    func changeButtonClicked()
    func textLabelShared()
}
