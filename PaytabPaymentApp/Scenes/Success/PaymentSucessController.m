//
//  PaymentSucessController.m
//  PaytapConfigure
//
//  Created by Vijay on 06/06/20.
//  Copyright © 2020 Vijay. All rights reserved.
//

#import "PaymentSucessController.h"
#import "PaytabPaymentApp-Swift.h"


@interface PaymentSucessController ()

@end

@implementation PaymentSucessController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"success info is %@", [_paymentInfo desc]);
    UIImage * image;
    if([_paymentInfo success]) {
        image = [UIImage imageNamed:@"success"];
    } else {
        image = [UIImage imageNamed:@"failure"];
    }
    
    self.iconImageView.image = image;
    self.statusLabel.text = [NSString stringWithFormat: @"%@ ,PaymentId:%d", [_paymentInfo desc], [_paymentInfo paymentId]];
    // Do any additional setup after loading the view.
}


@end
