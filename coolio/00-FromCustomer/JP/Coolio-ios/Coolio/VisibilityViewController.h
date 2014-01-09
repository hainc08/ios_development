//
//  VisibilityViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgePublishViewController.h"
#import "MyPublish.h"
#import "UITableViewController+PassLock.h"

@interface VisibilityViewController : UITableViewController
{
    int sectionsCount;
    MyPublish* account;
}

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_publish;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_ageUpper;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_ageLower;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexGay;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexBisex;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexStraight;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceAsian;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceWhite;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceBlack;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceLatin;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceArab;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_racePolynesian;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceMix;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceEtc;
/*
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleTwink;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleHunk;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleSurfer;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleHipHop;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleThug;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_stylePunk;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleWhiteCollar;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleHardcoreGay;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_stylePotato;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleBear;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleGeek;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleChubby;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleBeefy;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleBodybuilder;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleWellMuscled;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleSlimSkinny;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleFeminine;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleShemale;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleEtc;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingLover;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingFriend;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingEPal;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingMPal;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingTPal;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingCircle;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingRoommate;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingBPartner;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingFriendWithBenefits;
*/

@property (weak, nonatomic) IBOutlet UISwitch *sw_publish;
//@property (weak, nonatomic) IBOutlet UISwitch *sw_age;

@property (weak, nonatomic) IBOutlet UISwitch *sw_sexGay;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexBisex;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexStraight;

@property (weak, nonatomic) IBOutlet UISwitch *sw_raceAsian;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceWhite;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceBlack;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceLatin;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceArab;
@property (weak, nonatomic) IBOutlet UISwitch *sw_racePolynesian;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceMix;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceEtc;

/*
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleTwink;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleHunk;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleSurfer;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleHipHop;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleThug;
@property (weak, nonatomic) IBOutlet UISwitch *sw_stylePunk;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleWhiteCollar;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleHardcoreGay;
@property (weak, nonatomic) IBOutlet UISwitch *sw_stylePotato;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleBear;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleGeek;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleChubby;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleBeefy;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleBodybuilder;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleWellMuscled;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleSlimSkinny;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleFeminine;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleShemale;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleEtc;

@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingLover;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingFriend;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingEPal;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingMPal;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingTPal;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingCircle;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingRoommate;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingBPartner;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingFriendWithBenefits;
*/

@property (weak, nonatomic) IBOutlet UILabel *lbl_ageUpper;
@property (weak, nonatomic) IBOutlet UILabel *lbl_ageLower;

@property (retain, nonatomic) NSMutableDictionary* sexualityDict;
@property (retain, nonatomic) NSMutableDictionary* raceDict;
//@property (retain, nonatomic) NSMutableDictionary* styleDict;
//@property (retain, nonatomic) NSMutableDictionary* lookingDict;


- (IBAction)sw_publishValueChanged:(id)sender;
- (IBAction)sw_sexGay_valueChanged:(id)sender;
- (IBAction)sw_sexBisexual_valueChanged:(id)sender;
- (IBAction)sw_sexStraight_valueChanged:(id)sender;
- (IBAction)sw_raceAsian_valueChanged:(id)sender;
- (IBAction)sw_raceWhite_valueChanged:(id)sender;
- (IBAction)sw_raceBlack_valueChanged:(id)sender;
- (IBAction)sw_raceLatin_valueChanged:(id)sender;
- (IBAction)sw_raceArab_valueChanged:(id)sender;
- (IBAction)sw_racePolynesian_valueChanged:(id)sender;
- (IBAction)sw_raceMix_valueChanged:(id)sender;
- (IBAction)sw_raceEtc_valueChanged:(id)sender;
/*
- (IBAction)sw_styleTwink_valueChanged:(id)sender;
- (IBAction)sw_styleHunk_valueChanged:(id)sender;
- (IBAction)sw_styleSurfer_valueChanged:(id)sender;
- (IBAction)sw_styleHipHop_valueChanged:(id)sender;
- (IBAction)sw_styleThug_valueChanged:(id)sender;
- (IBAction)sw_stylePunk_valueChanged:(id)sender;
- (IBAction)sw_styleWhiteCollar_valueChanged:(id)sender;
- (IBAction)sw_styleHardcoreGay_valueChanged:(id)sender;
- (IBAction)sw_stylePotato_valueChanged:(id)sender;
- (IBAction)sw_styleBear_valueChanged:(id)sender;
- (IBAction)sw_styleGeek_valueChanged:(id)sender;
- (IBAction)sw_styleChubby_valueChanged:(id)sender;
- (IBAction)sw_styleBeefy_valueChanged:(id)sender;
- (IBAction)sw_styleBodybuilder_valueChanged:(id)sender;
- (IBAction)sw_styleSlimWellMuscled_valueChanged:(id)sender;
- (IBAction)sw_styleSlimSkinny_valueChanged:(id)sender;
- (IBAction)sw_styleFeminine_valueChanged:(id)sender;
- (IBAction)sw_styleShemale_valueChanged:(id)sender;
- (IBAction)sw_styleEtc_valueChanged:(id)sender;
- (IBAction)sw_lookingLover_valueChanged:(id)sender;
- (IBAction)sw_lookingFriend_valueChanged:(id)sender;
- (IBAction)sw_lookingEPal_valueChanged:(id)sender;
- (IBAction)sw_lookingMPal_valueChanged:(id)sender;
- (IBAction)sw_lookingTelPal_valueChanged:(id)sender;
- (IBAction)sw_lookingCircle_valueChanged:(id)sender;
- (IBAction)sw_lookingRoommate_valueChanged:(id)sender;
- (IBAction)sw_lookingBusinessPartner_valueChanged:(id)sender;
- (IBAction)sw_lookingFriendWithBenefits_valueChanged:(id)sender;
*/

- (IBAction)btn_donePush:(id)sender;

@end
