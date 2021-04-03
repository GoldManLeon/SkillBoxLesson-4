//
//  MainDelegate.swift
//  SkillBoxLesson4
//
//  Created by Левон on 02.04.2021.
//

import Foundation

protocol ViewModelDelegate{
    func numberOrRows() -> Int
    func cellViewModel(for indexPath: Int) -> Model?
}
