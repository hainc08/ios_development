//
//  StampStoreController.h
//  iTell
//
//  Created by mai van hai on 8/13/12.
//
//

#import <UIKit/UIKit.h>

@interface StampStoreController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tblView;
    IBOutlet UISegmentedControl *segment;
}
@property(nonatomic,retain) IBOutlet UITableView *tblView;
@property(nonatomic,retain) IBOutlet UISegmentedControl *segment;
@end
