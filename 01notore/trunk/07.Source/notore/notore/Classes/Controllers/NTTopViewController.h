//
//  NTTopViewController.h
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "BaseViewController.h"

@interface NTTopViewController : BaseViewController
{
    int levelClear;
    IBOutlet UIButton* bt1;
    IBOutlet UIButton* bt2;
    IBOutlet UIButton* bt3;
    IBOutlet UIButton* bt4;
    IBOutlet UIButton* bt5;
    IBOutlet UIButton* bt6;
    IBOutlet UILabel* lbl;
    
    IBOutlet UIView* lblView;
    IBOutlet UIView* imageView;
}
// Popup view
@property (strong, nonatomic) IBOutlet UIView *viewClear;
@property (strong, nonatomic) IBOutlet UIView *viewReset;
- (IBAction)onHelp:(id)sender;
- (void)startNotoreWithLevel:(NSInteger) level;
- (IBAction)onReset:(id)sender;
- (IBAction)btReset:(id)sender;
- (IBAction)btCancelReset:(id)sender;
- (IBAction)btOKClear:(id)sender;
- (void) showImageForButtons;
@end
