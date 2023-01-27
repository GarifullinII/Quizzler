//
//  Question.swift
//  Quizzler
//
//  Created by Ildar Garifullin on 26/01/2023.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
