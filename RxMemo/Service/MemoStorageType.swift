//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    // crud
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
    
}
