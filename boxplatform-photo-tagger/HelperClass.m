//
//  HelperClass.m
//  boxplatform-photo-tagger
//
//  Created by Karl Hirschhorn on 7/22/16.
//  Copyright © 2016 Karl Hirschhorn. All rights reserved.
//

#import "HelperClass.h"
#import <AFNetworking.h>
#import <UIKit/UIKit.h>

@implementation HelperClass

+(UIViewController*)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                                   //TODO send user back to main view
                               }];
    [alert addAction:okButton];
    
    return alert;
}

@end

