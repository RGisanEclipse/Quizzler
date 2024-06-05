//
//  Question.swift
//  Quizzler
//
//  Created by Eclipse on 07/02/24.
//

import Foundation
struct Question{
    var question: String
    var answer: Array<String>
    var correctAnswer: String
    init(q: String, a: Array<String>, correctAnswer: String){
        question = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
