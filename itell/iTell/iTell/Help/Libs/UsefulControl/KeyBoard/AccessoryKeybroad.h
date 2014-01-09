//
//  AccessoryKeybroad.h
//  AccessoryKeybroad
//
//  Created by bon on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessoryKeybroad : UIToolbar
<UITextFieldDelegate>
{
    UITextField *currentTextField;
    IBOutlet UISegmentedControl *segment;
    UIView *parentView;
    bool isKeyBoardShow;
    CGSize sizeDefault;
    CGRect rectDefault;
}

@property (nonatomic, retain) NSArray *textFiends;

- (id) initWithTextItems:(NSArray*)items parent:(UIView*)scrollView;
@property (retain, nonatomic) IBOutlet UIButton *buttonNext;
@property (retain, nonatomic) IBOutlet UIButton *buttonPrevious;
- (IBAction)textDoneEditing:(id)sender;
- (IBAction)nextClick:(id)sender;
- (IBAction)previousClick:(id)sender;


@end
