//
//  ConfirmRegisterController.h
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"
#import "AccessoryKeybroad.h"

@interface ConfirmRegisterController : UIViewController<ApiRequestDelegate, UITextFieldDelegate>{

    ApiRequest *_apiRequest;
    AccessoryKeybroad *keyBoardInput;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *codeEnterTextField;
}
@property(nonatomic, retain) NSString *mobilePhone;
@property(nonatomic, retain) NSString *isp;

- (IBAction)sendBtnClicked:(id)sender;
@end
