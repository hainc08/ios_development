//
//  ItellShareStatusController.h
//  iTell
//
//  Created by tranduc on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"

typedef enum {
    kItellPolicy_ALL = 1,
    kItellPolicy_FRIEND_ONLY = 2,
    kItellPolicy_OTHER_ONLY=3
}kItellPlicy;

@class ItellShareStatusController;
@protocol ItellShareStatusControllerDelegate <NSObject>

-(void)shareItell:(NSString*)itellStr withPolicy:(kItellPlicy)type;

@end

@interface ItellShareStatusController : UIViewController<UITextFieldDelegate, ApiRequestDelegate, UIAlertViewDelegate>
@property(nonatomic)kItellPlicy typeSharing;
@property (retain, nonatomic) IBOutlet UITextField *tfMessage;
@property (nonatomic, assign) id<ItellShareStatusControllerDelegate>delegate;
@property (retain, nonatomic) IBOutlet UIView *viewShare;
@property (retain, nonatomic) IBOutlet UILabel *lbType;
@property (retain, nonatomic) IBOutlet UIImageView *imBackground;


- (IBAction)touchOnBackground:(id)sender;
- (IBAction)btSendPressed:(id)sender;
- (IBAction)btBackPressed:(id)sender;

@end
