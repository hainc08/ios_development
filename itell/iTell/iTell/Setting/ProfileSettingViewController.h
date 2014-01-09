//
//  ProfileSettingViewController.h
//  iTell
//
//  Created by Thap on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileSettingCellViewController.h"
#import "CustomSwitch.h"
#import "AccessoryKeybroad.h"

@interface ProfileSettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ProfileSettingCellDelegate, UITextFieldDelegate,CustomSwitchDelegate>
{

    IBOutlet UIScrollView *scrollView;
    IBOutlet UITableView *_tbl;
    IBOutlet UILabel *numberIcon1Lb;
    IBOutlet UILabel *numberIcon2Lb;
    IBOutlet UILabel *numberIcon4Lb;
    IBOutlet UITextField *nameLb;
    IBOutlet UITextField *nickNameLb;
    IBOutlet UITextField *dateLb;
    IBOutlet UITextField *monthLb;
    IBOutlet UITextField *yearLb;
    IBOutlet UILabel *phoneLb;
    
    IBOutlet CustomSwitch *sexSwitch;
    IBOutlet CustomSwitch *birthdaySwitch;
    AccessoryKeybroad *keyBoardInput;
    BOOL isFemale;
    BOOL isDisplayBirthday;
}
-(IBAction)backBtnClicked:(id)sender;
@end
