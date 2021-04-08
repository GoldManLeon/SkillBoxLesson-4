//
//  MainDelegate.swift
//  SkillBoxLesson4
//
//  Created by Левон on 02.04.2021.
//

import Foundation

import Foundation

protocol MVVMAViewModelDelegate{
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> CellViewModelDelegate?
}
