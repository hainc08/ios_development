//
//  WeightViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
//#import "MyUnit.h"
#import "UIViewController+PassLock.h"

@interface WeightViewController : UIViewController<UITextFieldDelegate>
{
    MyProfiles* account;
}

@property (weak, nonatomic) IBOutlet UITextField *txt_weight;
- (IBAction)txt_weight_EditingDidEnd:(id)sender;
@end
