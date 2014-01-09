//
//  PrivacyViewController.h
//  iTell
//
//  Created by mai van hai on 8/9/12.
//
//

#import <UIKit/UIKit.h>
#import "SettingPushViewCell.h"
#import "ApiRequest.h"

#define kUserName @"itell"
#define kPassWord @"itell@2012"
#define kSettingSearchFriend    @"SearchFriend"
#define kSettingSearchContact   @"SearchContact"
#define kSettingGetBlockList    @"BlockList"

#define kSettingAllowSearch     @"allowSearch"
#define kSettingDenySearch     @"denySearch"


@interface PrivacyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SettingPushViewCellDelegate,ApiRequestDelegate> {
    IBOutlet UITableView *tblView;
    NSArray *arrNameContact;
    NSArray *arrPhoneContact;
    NSArray *arrEmailContact;
}
@property(nonatomic, retain) IBOutlet UITableView *tblView;
- (IBAction)actionBack:(id)sender;
- (void)setValueState:(BOOL)flag withKey:(NSString *)strKey;
- (BOOL)getValueState:(NSString *)strKey;
- (void)getAllInfoContact;
@end
