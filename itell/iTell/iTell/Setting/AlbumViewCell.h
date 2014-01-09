//
//  AlbumViewCell.h
//  iTell
//
//  Created by Minh Pham Tuan on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlbumViewCellDelegate <NSObject>

@optional
-(void)imageCellSelected:(NSInteger)cellIndex;

@end
@interface AlbumViewCell : UITableViewCell<UIScrollViewDelegate>
{
    id<AlbumViewCellDelegate> delegate;
}
@property(nonatomic, retain) id<AlbumViewCellDelegate> delegate;
@property(nonatomic, assign) NSInteger cellIndex;
@property(nonatomic, assign) IBOutlet UIScrollView *scroll;
@property(nonatomic, assign) IBOutlet UIImageView *imageViewBg;
@property(nonatomic, assign) IBOutlet UIImageView *imageViewOverlay;
@end
