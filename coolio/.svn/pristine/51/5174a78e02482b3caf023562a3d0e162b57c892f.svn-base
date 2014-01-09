//
//  AccountDetailViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/05/16.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "ChatMessagesViewController.h"
#import "SVProgressHUD.h"
#import "UIImageView+WebCache.h"
#import "GlobalObjects.h"
#import "CoolioWebService.h"
#import "MyProfiles.h"
#import "MyUnit.h"
#import "MyFootPrintSettings.h"
#import "UserProfile.h"
#import "UITableViewController+PassLock.h"

@interface AccountDetailViewController : UITableViewController<UIAlertViewDelegate, UIActionSheetDelegate, UIScrollViewDelegate>
{
    NSArray* cellProfTitle_en;
    NSArray* cellProfTitle_ja;

    NSArray* cellPubTitle_en;
    NSArray* cellPubTitle_ja;
    
    //BOOL isBlockButtonPush;
    //BOOL isReportButtonPush;
    
    BOOL isFriendRequestPush;
    BOOL isSilentMatchRequestPush;

    BOOL isNotifiFriendAnswer;
    BOOL isNotifiSilentMatchAnswer;
    BOOL isNotifiChatAnswer;
    BOOL isBlockAnswer;
    BOOL isBeBlock;
    
    BOOL _isMyIdTaped;
    
    //CGFloat profileDataHeight;
    //CGFloat publishDataHeight;
    UserProfile* _userProfile;
    MyProfiles* account;
    
    NSMutableDictionary* _iconCacheDict;
    //NSDictionary* _userInfoDict;
    //NSString* _myId;
    CoolioWebService* coolio;
    UIScrollView* _scrollView;
}

@property(nonatomic) BOOL isMyIdTaped;
@property(nonatomic, strong) UserProfile* userProfile;
//@property(nonatomic, strong) NSDictionary* userInfoDict;
@property(nonatomic) NSString* myId;
@property(nonatomic) NSString* userId;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@property (weak, nonatomic) IBOutlet UITableViewCell *cell_picture;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_command;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_status;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lastUpdate;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_distance;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_nickName;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_age;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_height;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_weight;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexuallity;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_race;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_country;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_style;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingForLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingFor;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_commentLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_comment;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyShape;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_muscle;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyHair;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyle;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColor;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacteristicsLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacteristics;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p9;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p10;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p11;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p12;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p13;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p14;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p15;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p16;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p17;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_p18;

@property (weak, nonatomic) IBOutlet UIProgressView *p0;
@property (weak, nonatomic) IBOutlet UIProgressView *p1;
@property (weak, nonatomic) IBOutlet UIProgressView *p2;
@property (weak, nonatomic) IBOutlet UIProgressView *p3;
@property (weak, nonatomic) IBOutlet UIProgressView *p4;
@property (weak, nonatomic) IBOutlet UIProgressView *p5;
@property (weak, nonatomic) IBOutlet UIProgressView *p6;
@property (weak, nonatomic) IBOutlet UIProgressView *p7;
@property (weak, nonatomic) IBOutlet UIProgressView *p8;
@property (weak, nonatomic) IBOutlet UIProgressView *p9;
@property (weak, nonatomic) IBOutlet UIProgressView *p10;
@property (weak, nonatomic) IBOutlet UIProgressView *p11;
@property (weak, nonatomic) IBOutlet UIProgressView *p12;
@property (weak, nonatomic) IBOutlet UIProgressView *p13;
@property (weak, nonatomic) IBOutlet UIProgressView *p14;
@property (weak, nonatomic) IBOutlet UIProgressView *p15;
@property (weak, nonatomic) IBOutlet UIProgressView *p16;
@property (weak, nonatomic) IBOutlet UIProgressView *p17;
@property (weak, nonatomic) IBOutlet UIProgressView *p18;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_gayCareer;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_comingout;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_loveStyle;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_living;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePolicyLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePolicy;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexPosition;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_pSize;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisThickness;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_phimosis;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sadomasochism;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_fetishLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_fetish;







//@property (weak, nonatomic) IBOutlet UILabel *lbl_styleValue;
//@property (weak, nonatomic) IBOutlet UITextView *txt_style;
//@property (weak, nonatomic) IBOutlet UITextView *txt_lookingFor;
//@property (weak, nonatomic) IBOutlet UITextView *txt_comment;
//@property (weak, nonatomic) IBOutlet UITextView *txt_otherCharacteristics;
//@property (weak, nonatomic) IBOutlet UITextView *txt_lifePolicy;
//@property (weak, nonatomic) IBOutlet UITextView *txt_fetish;


@property (weak, nonatomic) IBOutlet UILabel *lbl_lastUpdate;
@property (weak, nonatomic) IBOutlet UILabel *lbl_distance;


@property (weak, nonatomic) IBOutlet UILabel* lbl_nickName;
@property (weak, nonatomic) IBOutlet UILabel* lbl_age;
@property (weak, nonatomic) IBOutlet UILabel* lbl_height;
@property (weak, nonatomic) IBOutlet UILabel* lbl_weight;
@property (weak, nonatomic) IBOutlet UILabel* lbl_sexuallity;
@property (weak, nonatomic) IBOutlet UILabel* lbl_race;
@property (weak, nonatomic) IBOutlet UILabel* lbl_country;

@property (weak, nonatomic) IBOutlet UILabel* lbl_bodyShape;
@property (weak, nonatomic) IBOutlet UILabel* lbl_muscle;
@property (weak, nonatomic) IBOutlet UILabel* lbl_bodyHair;
@property (weak, nonatomic) IBOutlet UILabel* lbl_hairStyle;
@property (weak, nonatomic) IBOutlet UILabel* lbl_hairColor;

@property (weak, nonatomic) IBOutlet UILabel* lbl_gayCareer;
@property (weak, nonatomic) IBOutlet UILabel* lbl_comingOut;
@property (weak, nonatomic) IBOutlet UILabel* lbl_loveStyle;
@property (weak, nonatomic) IBOutlet UILabel* lbl_expect;

@property (weak, nonatomic) IBOutlet UILabel* lbl_job;
@property (weak, nonatomic) IBOutlet UILabel* lbl_living;

@property (weak, nonatomic) IBOutlet UILabel* lbl_sexPosition;
@property (weak, nonatomic) IBOutlet UILabel* lbl_pSize;
@property (weak, nonatomic) IBOutlet UILabel* lbl_penisThickness;
@property (weak, nonatomic) IBOutlet UILabel* lbl_phimosis;
@property (weak, nonatomic) IBOutlet UILabel* lbl_sadomasochism;
//@property (weak, nonatomic) IBOutlet UILabel *lbl_fetish;


//@property (weak, nonatomic) IBOutlet UITextView *txt_profile;
//@property (weak, nonatomic) IBOutlet UITextView *txt_publish;
@property (weak, nonatomic) IBOutlet UIButton *btn_friend;
@property (weak, nonatomic) IBOutlet UIButton *btn_silentMatch;
@property (weak, nonatomic) IBOutlet UIButton *btn_chat;

@property (weak, nonatomic) IBOutlet UILabel *lbl_status;


-(void)toNotifyTheIsFriend:(NSNotification *)notification;
-(void)toNotifyTheIsSilentMatch:(NSNotification *)notification;

- (IBAction)btn_actionPush:(id)sender;
- (IBAction)btn_friendPush:(id)sender;
- (IBAction)btn_silentMatchPush:(id)sender;
//- (IBAction)btn_chatPush:(id)sender;

@end
