//
//  NewsCustomCell.h
//  Istation
//
//  Created by Admin on 26/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavouriteCell : UITableViewCell{
    IBOutlet UILabel *strTitle;
    IBOutlet UISwitch *switchControl;
    // SideSwipe
    BOOL supressDeleteButton;
}

@property(nonatomic,retain) IBOutlet UILabel *strTitle;
@property(nonatomic,retain) IBOutlet UISwitch *switchControl;
///
@property (nonatomic) BOOL supressDeleteButton;



@end
