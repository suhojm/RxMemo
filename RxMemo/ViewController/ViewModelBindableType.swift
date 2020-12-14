//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import UIKit

protocol ViewModelBindableType {
    // define protocol as generic type
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}


extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel : Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
