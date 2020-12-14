//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}


enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
