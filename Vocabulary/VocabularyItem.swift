//
//  VocabularyItem.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/25/21.
//

import Foundation

struct VocabularyExampleItem: Decodable {
    
    var id: Int?
    var subID: Int?
    var type: Int?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case subID = "sub_id"
        case type
        case content
    }
    
}

struct VocabularyItem: Decodable {
    
    var id: Int?
    var name: String?
    var part: String?
    var posGram: String?
    var audio: String?
    var soundMark: String?
    var title: String?
    var level: Int?
    var definition: String?
    var dExamples: [VocabularyExampleItem] = []
    var lExamples: [VocabularyExampleItem] = []
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case part
        case posGram = "pos_gram"
        case audio
        case soundMark = "sound_mark"
        case title
        case level
        case definition
        case dExamples = "d_examples"
        case lExamples = "l_examples"
    }
    
}
