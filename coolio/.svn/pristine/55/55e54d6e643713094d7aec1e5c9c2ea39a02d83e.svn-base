//
//  AgePublishViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPublish.h"
#import "UITableViewController+PassLock.h"

@interface AgePublishViewController : UITableViewController<UITextFieldDelegate>
{
    //NSString* notifiValue;
    MyPublish* account;
    int value;
}
@property (weak, nonatomic) NSString* notifiValue;
@property (weak, nonatomic) IBOutlet UISlider *sli_age;
@property (weak, nonatomic) IBOutlet UITextField *txt_age;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_slider;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_textField;

- (IBAction)txt_age_EditingDidEnd:(id)sender;
- (IBAction)ageSlider_valueChanged:(id)sender;

@end
