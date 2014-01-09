//
//  SendAdditionEmailController.h
//  iTell
//
//  Created by tranduc on 9/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"

@interface SendAdditionEmailController : UIViewController<ApiRequestDelegate, UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UITextField *tfEmail;
- (IBAction)sendEmailPressed:(id)sender;
- (IBAction)backPressed:(id)sender;

@end
