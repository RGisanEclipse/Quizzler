//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Eclipse on 07/02/24.
//

import Foundation
struct QuizBrain{
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    var questionNumber = 0
    var score = 0
    var questionsFinished = false
    func getQuestionText()->String!{
        return quiz[questionNumber].question
    }
    func getOptionText(_ index: Int)->String{
        return quiz[questionNumber].answer[index]
    }
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        let correctAnswer = quiz[questionNumber].correctAnswer
        if userAnswer == correctAnswer{
            score += 1
            return true
        } else{
            if score != 0{
                score -= 1
            }
            return false
        }
    }
    mutating func nextQuestion(){
        if(questionNumber < quiz.count-1){
            questionNumber += 1
        } else{
            questionsFinished = true
        }
    }
    mutating func resetQuiz(){
        questionNumber = 0
        score = 0
        questionsFinished = false
    }
    func getProgress() -> Float{
        return Float(questionNumber)/Float(quiz.count)
    }
    func getScore() -> String{
        return "Score: \(score)"
    }
    func getScoreForSegue() -> String{
        return "\(score)"
    }
    func getQuestionsFinished() -> Bool{
        return questionsFinished
    }
}
