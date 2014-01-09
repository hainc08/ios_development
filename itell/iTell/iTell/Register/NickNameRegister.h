//
//  NickNameRegister.h
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"
#import "CustomSwitch.h"
#import "AccessoryKeybroad.h"

@interface NickNameRegister : UIViewController<UITextFieldDelegate, ApiRequestDelegate,CustomSwitchDelegate>{

    ApiRequest *_apiRequest;
    AccessoryKeybroad *keyBoardInput;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *nickNameTF;
    IBOutlet UITextField *yourNameTF;
    IBOutlet UIImageView *maleImageView;
    IBOutlet UIImageView *fremailImageView;
    IBOutlet UITextField *yearTF;
    IBOutlet UITextField *monthTF;
    IBOutlet UITextField *dayTF;
    IBOutlet CustomSwitch *sexSwitch;
    IBOutlet CustomSwitch *birthdaySwitch;

    BOOL isFemale;
    BOOL isDisplayBirthday;
    NSString *birhday;
}
@property(nonatomic,retain)NSString* isp;
@property(nonatomic,retain)NSString* mobilePhone;
@property(nonatomic,retain)NSString* authenCode;

- (IBAction)agreeBtnClicked:(id)sender;
- (IBAction)maleBtnClicked:(id)sender;
- (IBAction)fremailBtnClicked:(id)sender;
- (void) sendUserData;
-(void)showAlert:(NSString*)message;

@end
