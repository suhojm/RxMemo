//
//  Memo.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import Foundation
import RxDataSources

struct Memo: Equatable, IdentifiableType {
    var content: String // store memo
    var insertDate: Date
    var identity: String // to idenfity memo
    
    // constructor
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
