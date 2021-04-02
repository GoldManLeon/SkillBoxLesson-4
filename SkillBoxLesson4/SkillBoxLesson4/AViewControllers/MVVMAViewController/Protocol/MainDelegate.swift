//
//  MainDelegate.swift
//  SkillBoxLesson4
//
//  Created by Левон on 02.04.2021.
//

import Foundation

protocol MainDelegate{
    func numberOrRows() -> Int
    func cellIndexPath(for indexPath: IndexPath) -> CellViewModelDelegate?
}
