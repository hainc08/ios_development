//
//  MyProfileViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUnit.h"
#import "MyProfiles.h"
#import "EmailViewController.h"
#import "UITableViewController+PassLock.h"

@interface MyProfileViewController : UITableViewController<UINavigationControllerDelegate>
{
    MyUnit* unit;
    MyProfiles* account;
    BOOL isSettingOkFlag;
}

@property(nonatomic) NSString* myId;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_email;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_pass;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lastname;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_unit;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_9;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_10;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_11;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_12;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_13;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_14;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_15;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_16;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_17;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_18;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_19;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_20;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_21;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_22;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_23;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_24;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_25;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_26;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_27;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_28;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_29;

@property (weak, nonatomic) IBOutlet UILabel *lbl_email;
@property (weak, nonatomic) IBOutlet UILabel *lbl_password;
@property (weak, nonatomic) IBOutlet UILabel *lbl_lastname;
@property (weak, nonatomic) IBOutlet UILabel *lbl_age;
@property (weak, nonatomic) IBOutlet UILabel *lbl_height;
@property (weak, nonatomic) IBOutlet UILabel *lbl_weight;
@property (weak, nonatomic) IBOutlet UILabel *lbl_sexuallity;
@property (weak, nonatomic) IBOutlet UILabel *lbl_race;

@property (weak, nonatomic) IBOutlet UILabel *lbl_country;

@property (weak, nonatomic) IBOutlet UISegmentedControl *seg_unit;

- (IBAction)seg_unitValueChanged:(id)sender;
- (IBAction)btn_donePush:(id)sender;


@end
