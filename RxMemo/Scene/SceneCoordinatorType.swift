//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
