//
//  CarrierChooseViewController.h
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
	ISP_SOFTBANK	= 1,
	ISP_AU		    = 2 ,
	ISP_DOCOMO		= 3 ,
} ISP;

@interface CarrierChooseViewController : UIViewController{

    IBOutlet UIImageView *checkImageView1;
    IBOutlet UIImageView *checkImageView2;
    IBOutlet UIImageView *checkImageView3;
    NSInteger carrierNumber;
}

- (IBAction)softbankBtnClicked:(id)sender;
- (IBAction)auBtnClicked:(id)sender;
- (IBAction)docomoBtnClicked:(id)sender;
-(void)submit;
@end
