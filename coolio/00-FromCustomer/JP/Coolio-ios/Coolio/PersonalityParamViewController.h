//
//  PersonalityParamViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/29.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
#import "UIViewController+PassLock.h"

@interface PersonalityParamViewController : UIViewController<UINavigationControllerDelegate>
{
    NSMutableDictionary* personalityDict;
    MyProfiles* account;
    BOOL isChanged;
}

@property (nonatomic, strong) NSNumber* selectedSectionIndex;
@property (weak, nonatomic) IBOutlet UILabel *lbl_personality;
@property (weak, nonatomic) IBOutlet UISlider *sli_personality;
- (IBAction)sli_valueChanged:(id)sender;

@end
