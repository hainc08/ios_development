//
//  StarAlertView.h
//  StarAlertApp
//
//  Created by admin trator on 6/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol StarAlertDelegate;
@class starsView;
@class SendSMSViewController;

@interface StarAlertView : UIAlertView<UIAlertViewDelegate>{

}

@property (nonatomic, retain) SendSMSViewController *target;

- (id) initWithPhoneNumber:(NSString*)phoneNumber;
- (void) closeButtonClicked;
- (void) okBtnClicked;

@end

//@protocol StarAlertDelegate <NSObject>
//
//@optional
//- (void) ratingResult:(NSInteger) rateNumber;

//@end