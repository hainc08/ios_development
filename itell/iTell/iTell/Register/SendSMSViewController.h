//
//  SendSMSViewController.h
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccessoryKeybroad.h"
#import "ApiRequest.h"

@interface SendSMSViewController : UIViewController<UITextFieldDelegate,ApiRequestDelegate>{

    IBOutlet UITextField *phoneNumberTx;
    AccessoryKeybroad *keyBoardInput;
    IBOutlet UIScrollView *scrollView;
    ApiRequest *_apiRequest;
}
@property (nonatomic, assign) NSInteger ispProvider;

- (IBAction)sendBtnClicked:(id)sender;
-(void)acceptSendMobilePhone;
@end
