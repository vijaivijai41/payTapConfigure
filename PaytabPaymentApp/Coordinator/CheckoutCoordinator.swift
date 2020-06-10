//
//  CheckoutCoordinator.swift
//  PaytapConfigure
//
//  Created by Vijay on 10/06/20.
//  Copyright © 2020 Vijay. All rights reserved.
//

import Foundation
import UIKit

class CheckoutCoordinator:NSObject, Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    let parentController: CheckoutController
    let repository: Repository
    let viewModel: CheckoutViewModel
    let checkoutInfo: CheckoutInfo
   
    var initialSetupViewController: PTFWInitialSetupViewController!
    var paymentController: PTFWOperationPrepareTransaction!

    
    init(parentController: CheckoutController, repository: Repository, checkoutInfo: CheckoutInfo, viewModel: CheckoutViewModel) {
        self.repository = repository
        self.parentController = parentController
        self.checkoutInfo = checkoutInfo
        self.viewModel = viewModel
    }
    
    
    func start() {
        var amount: Float = 0.0
        if let _amount = Float(checkoutInfo.amount)  {
            amount = _amount
        }
        DispatchQueue.main.async {
            self.initialSetupViewController = PTFWInitialSetupViewController(
                bundle: self.repository.dataStore.resourceBundle,
                andWithViewFrame: self.parentController.view.frame,
                andWithAmount: amount,
                andWithCustomerTitle: self.checkoutInfo.customerTitle,
                andWithCurrencyCode: "USD",
                andWithTaxAmount: 0.0,
                andWithSDKLanguage: "en",
                andWithShippingAddress: "Manama",
                andWithShippingCity: "Manama",
                andWithShippingCountry: "BHR",
                andWithShippingState: "Manama",
                andWithShippingZIPCode: "123456",
                andWithBillingAddress: "Manama",
                andWithBillingCity: "Manama",
                andWithBillingCountry: "BHR",
                andWithBillingState: "Manama",
                andWithBillingZIPCode: "1234543242",
                andWithOrderID: "1234343345",
                andWithPhoneNumber: self.checkoutInfo.mobile,
                andWithCustomerEmail: self.checkoutInfo.email,
                andIsTokenization:false,
                andIsPreAuth: false,
                andWithMerchantEmail: self.repository.dataStore.merchentEmail,
                
                andWithMerchantSecretKey: self.repository.dataStore.secretKey,
                andWithAssigneeCode: "SDK",
                andWithThemeColor:UIColor.red,
                andIsThemeColorLight: false)
            
            self.initialSetupViewController.didReceiveBackButtonCallback = {
                self.viewModel.dismissHandler()
            }
            
            self.initialSetupViewController.didStartPreparePaymentPage = {
                // Start Prepare Payment Page
                // Show loading indicator
                self.parentController.showLoader()
            }
            self.initialSetupViewController.didFinishPreparePaymentPage = {
                // Finish Prepare Payment Page
                // Stop loading indicator
                self.parentController.hideLoader()
            }
            
            self.initialSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
                
                var paymentStatus: Bool = false
                var description: String = ""
                var messgae: String = ""
                
                if result == "Approved" && transactionID > 0 {
                    paymentStatus = true
                    description = "Payment successfully processed"
                    messgae = "Paymemt success"
                    
                } else {
                    paymentStatus = false
                    messgae = "Payment failure"
                    description = "something failure to payment failure"
                    
                }
                
                let succesinfo = SuccessInfo(success: paymentStatus, message: messgae, paymentId: transactionID, desc: description)
                self.viewModel.paymentSuccess(info: succesinfo)
            }
            self.parentController.view.addSubview(self.initialSetupViewController.view)
            self.parentController.addChild(self.initialSetupViewController)
            
            self.initialSetupViewController.didMove(toParent: self.parentController)
        }
    }
}
