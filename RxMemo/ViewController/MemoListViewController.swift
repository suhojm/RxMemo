//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by Jung Mo Ku on 12/10/20.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoListViewModel!

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title) // binding...
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        addButton.rx.action = viewModel.makeCreateAction()
        
        // For selecting a item of the memo list..
        Observable.zip(listTableView.rx.modelSelected(Memo.self), listTableView.rx.itemSelected)
            .do(onNext: { [unowned self] (_, indexPath) in // _, indexPath in
                self.listTableView.deselectRow(at: indexPath, animated: true)
            })
            .map { $0.0 }
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        
        
        // instaed of implement the delegate method directly,
        // use the method the one RxCocoa provides
        listTableView.rx.modelDeleted(Memo.self) // this method returns Control event, and control event release next event whenever memo gets deleted.
            .bind(to: viewModel.deleteAction.inputs) // to bind control event with delete action
            .disposed(by: rx.disposeBag)
        
        // when delete button is tapped, memo list releases new array, and table view reloads entire cells without any animation
        
        
        
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
