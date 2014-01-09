//
//  AlertViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/06/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+OpenMenue.h"
#import "UIViewController+PassLock.h"
#import "CoolioWebService.h"
#import "MyProfiles.h"
#import "SVProgressHUD.h"
#import "NSString+NSStringUtil.h"

@interface AlertViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray* alertArray;
    //UISegmentedControl* _titleSegControl;
    MyProfiles* account;
    CoolioWebService* coolio;
    NSString* myId;
}

@property (weak, nonatomic) IBOutlet UITableView *tblView;
//@property (strong, nonatomic) IBOutlet UISegmentedControl* titleSegControl;

- (IBAction)revealMenu:(id)sender;

@end
