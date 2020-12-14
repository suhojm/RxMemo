//
//  MemoComposeViewController.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import UIKit
import RxSwift
import RxCocoa
import Action
import NSObject_Rx

class MemoComposeViewController: UIViewController, ViewModelBindableType {

    var viewModel: MemoComposeViewModel!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.initialText
            .drive(contentTextView.rx.text) // contentTextView(View) - ViewModel -> model(logic - db?)
            .disposed(by: rx.disposeBag)
        
        cancelButton.rx.action = viewModel.cancelAction
        saveButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .withLatestFrom(contentTextView.rx.text.orEmpty)
            .bind(to: viewModel.saveAction.inputs)
            .disposed(by: rx.disposeBag)
    }
    
    
    // to make soft-keyboard to appear automatically, set the contentTextView as first responder...
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if contentTextView.becomeFirstResponder() {
            print("content text view is not first responder...")
        } else {
            print("failed for contentTextView to become first responder...")
        }
    }
    
    // resign contentTextView the first responder....
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if contentTextView.isFirstResponder {
            if contentTextView.resignFirstResponder() {
                print("successfully resign first responder...")
            } else {
                print("failed resign first responder...")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
