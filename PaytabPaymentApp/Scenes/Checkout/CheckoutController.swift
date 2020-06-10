//
//  CheckoutController.swift
//  PaytapConfigure
//
//  Created by Vijay on 10/06/20.
//  Copyright © 2020 Vijay. All rights reserved.
//

import UIKit

class CheckoutController: UITableViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var mobileTxt: UITextField!
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet var checkoutTablewview: UITableView!
    var viewModel: CheckoutViewModel!
    
    var initialSetupViewController: PTFWInitialSetupViewController!

    var paymentController: PTFWOperationPrepareTransaction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutTablewview.tableFooterView = UIView(frame: CGRect.zero)
    }
   
    @IBAction func proceedButtonDidTap(_ sender: UIButton) {
    
        let userName = usernameTxt.text ?? ""
        let email = emailText.text ?? ""
        let mobile = mobileTxt.text ?? ""
        let amount = amountText.text ?? ""

        if ValidationModel.checkoutValidation(username: userName, amount: amount, email: email, mobile: mobile) {
            let chekputInfo = CheckoutInfo(amount: amount, customerTitle: userName, mobile: mobile, email: email)
            viewModel.proccedButonDidTap(info: chekputInfo)
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

}

extension CheckoutController: CheckoutViewModelDelegte {
    func checkoutViewModel(viewModel: CheckoutViewModel, didProccedPayment info: CheckoutInfo) {
        
    }
    
    func checkoutViewModel(viewMoel: CheckoutViewModel, didFailure error: String) {
        
    }
}



