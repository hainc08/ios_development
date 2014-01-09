//
//  ComingOutViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
#import "UITableViewController+PassLock.h"

@interface ComingOutViewController : UITableViewController<UINavigationControllerDelegate>
{
    NSMutableDictionary* comingOutDict;
    int lastSelectedIndexRow;
    MyProfiles* account;
}
@end
