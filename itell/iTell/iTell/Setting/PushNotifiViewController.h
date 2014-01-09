//
//  PrivacyViewController.h
//  iTell
//
//  Created by mai van hai on 8/9/12.
//
//

#import <UIKit/UIKit.h>
#import "SettingPushViewCell.h"

#define kTagPushFriend    @"PushFriend"
#define kTagPushFr    @"PushFr"
#define kTagPushItell    @"PushItell"

@interface PushNotifiViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,SettingPushViewCellDelegate> {
    IBOutlet UITableView *tblView;
}
@property(nonatomic, retain) IBOutlet UITableView *tblView;
@property (assign, nonatomic) UIViewController *supperController;
- (IBAction)actionBack:(id)sender;
@end
