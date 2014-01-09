//
//  DescriptionViewController.h
//  iTell
//
//  Created by Thap on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DescriptionViewController : UIViewController<UITextViewDelegate>{

    IBOutlet UIScrollView* scrollView;
    IBOutlet UITextView *descriptionTV;
    IBOutlet UIToolbar *toolbar;
}
-(IBAction)saveBtnClicked:(id)sender;
-(IBAction)doneBtnClicked:(id)sender;
-(IBAction)backBtnClicked:(id)sender;
@end
