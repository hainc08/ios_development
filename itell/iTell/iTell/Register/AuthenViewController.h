//
//  AuthenViewController.h
//  iTell
//
//  Created by Thap on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthenViewController : UIViewController

@property (nonatomic, assign) NSInteger ispNumber;

-(IBAction)emailBtnClicked:(id)sender;
-(IBAction)smsBtnClicked:(id)sender;
@end
