//
//  Question.swift
//  Quizz
//
//  Created by Jianyu ZHU on 10/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

import Foundation

class Question {
    
    init(questionText: String, answer: Bool) {
        self.questionText = questionText
        self.answer = answer
    }
    
    let questionText: String
    let answer: Bool
    
}
