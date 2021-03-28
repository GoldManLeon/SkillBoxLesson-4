//
//  MVCBToDoList.swift
//  SkillBoxLesson4
//
//  Created by Левон on 26.03.2021.
//

import Foundation
import RealmSwift

class MVCBToDoListItem: Object{
    @objc dynamic var name = ""
    @objc dynamic var done = false
}
