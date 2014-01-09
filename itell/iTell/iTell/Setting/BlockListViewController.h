//
//  BlockListViewController.h
//  iTell
//
//  Created by mai van hai on 8/9/12.
//
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"
#import "BlockListCell.h"

#define kTagGetBlockList @"getBlockList"
#define kTagUnBlock        @"unBlock"
#define kTagAlertNotFound 10
@interface BlockListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,ApiRequestDelegate,BlockListCellDelegate> {
    IBOutlet UITableView *tblView;
    ApiRequest *apiRequest;
    NSMutableArray *arrBlockList;
}
@property(nonatomic, retain) IBOutlet UITableView *tblView;
@property (assign, nonatomic) UIViewController *supperController;
- (IBAction)actionBack:(id)sender;
@end
