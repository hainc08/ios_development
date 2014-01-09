//
//  ResultRegister.h
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultRegister : UIViewController<UITextFieldDelegate>

@property(nonatomic,retain)NSString* isp;
@property(nonatomic,retain)NSString* mobilePhone;
@property(nonatomic,retain)NSString* authenCode;


-(IBAction)registerBtnClicked:(id)sender;
@end
