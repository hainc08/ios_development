//
//  FilterPenisSizeViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/05/06.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFilter.h"
#import "UITableViewController+PassLock.h"

@interface FilterPenisSizeViewController : UITableViewController<UITextFieldDelegate>
{
    MyFilter* account;
}
@property (weak, nonatomic) IBOutlet UITableViewCell *cell0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell1;
@property (weak, nonatomic) IBOutlet UITextField *t1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg1;
- (IBAction)t1_EditingDidEnd:(id)sender;
- (IBAction)seg1_valueChanged:(id)sender;


@end
