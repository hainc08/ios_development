//
//  GayCareerViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
#import "UITableViewController+PassLock.h"

@interface GayCareerViewController : UITableViewController<UINavigationControllerDelegate>
{
    NSMutableDictionary* gayCareerDict;
    int lastSelectedIndexRow;
    MyProfiles* account;
}
@end
