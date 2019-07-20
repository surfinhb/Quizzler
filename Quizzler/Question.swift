//
//  Question.swift
//  Quizzler
//
//  Created by Jake Shapiro on 7/18/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let questionText: String
    let answer: Bool
    
    init(text q: String, correctAnswer  a: Bool) {
        questionText = q
        answer = a
    }
    
}



