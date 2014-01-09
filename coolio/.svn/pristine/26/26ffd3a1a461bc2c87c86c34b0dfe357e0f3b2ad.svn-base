//
//  BlocksViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewController+PassLock.h"
#import "MyProfiles.h"
#import "CoolioWebService.h"
#import "GlobalObjects.h"
#import "UserProfile.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface BlocksViewController : UITableViewController
{
    NSString* myId;
    MyProfiles* account;
    CoolioWebService* coolio;
    NSMutableArray* blockList;
    BOOL isEditing;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

- (IBAction)editButton_push:(id)sender;
- (IBAction)btn_donePush:(id)sender;

@end
