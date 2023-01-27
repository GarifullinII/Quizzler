//
//  Question.swift
//  Quizzler
//
//  Created by Ildar Garifullin on 26/01/2023.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correct = correctAnswer
    }
}
