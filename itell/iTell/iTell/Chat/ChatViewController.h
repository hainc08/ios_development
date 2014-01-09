//
//  ChatViewController.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ChatViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *tblView;
    AppDelegate *appDelegate;
    IBOutlet UILabel *lbTime;
}
@property(nonatomic, retain) IBOutlet UITableView *tblView;


@end
