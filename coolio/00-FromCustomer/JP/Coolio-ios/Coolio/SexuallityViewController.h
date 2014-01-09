//
//  SexuallityViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
#import "UITableViewController+PassLock.h"

@interface SexuallityViewController : UITableViewController
{
    int lastSelectedIndexRow;
    MyProfiles* account;
    NSMutableDictionary* sexualityDict;
}
@end
