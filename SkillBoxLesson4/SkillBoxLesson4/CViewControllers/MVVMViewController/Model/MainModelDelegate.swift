//
//  MainModelDelegate.swift
//  SkillBoxLesson4
//
//  Created by Левон on 28.03.2021.
//

import Foundation

protocol MainPluseModelDelegate{
    func plusTextDelegate(textPlus: String)
}

protocol MainMinusModelDelegate{
    func minusTextDelegate(textMinus: String)
}

protocol MainChangeModelDelegate{
    func changeTextDelegate(textChange: String)
}

protocol MainLabelModelDelegate{
    func labelTextDelegate(text: String)
}
