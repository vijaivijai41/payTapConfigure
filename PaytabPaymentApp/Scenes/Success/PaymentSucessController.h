//
//  PaymentSucessController.h
//  PaytapConfigure
//
//  Created by Vijay on 06/06/20.
//  Copyright © 2020 Vijay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class SuccessInfo;

NS_ASSUME_NONNULL_BEGIN

@interface PaymentSucessController : UIViewController
@property(strong,nonatomic) SuccessInfo *paymentInfo;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@end

NS_ASSUME_NONNULL_END
