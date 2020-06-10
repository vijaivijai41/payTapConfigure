//
//  CheckoutInfo.swift
//  PaytapConfigure
//
//  Created by Vijay on 06/06/20.
//  Copyright © 2020 Vijay. All rights reserved.
//

import Foundation

struct CheckoutInfo {
    
    let amount: String
    let customerTitle: String
    let mobile: String
    let email: String
}

@objcMembers class SuccessInfo: NSObject {
    let success: Bool
    let message: String
    let paymentId: Int32
    let desc: String
    
    init(success: Bool, message: String, paymentId: Int32, desc: String) {
        self.success = success
        self.message = message
        self.paymentId = paymentId
        self.desc = desc
    }

}

