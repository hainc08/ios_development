//
//  AlbumViewController.h
//  iTell
//
//  Created by Thap on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileSettingCellViewController.h"
#import "AlbumViewCell.h"
#import "UITableAlert.h"

@interface AlbumViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,ProfileSettingCellDelegate,AlbumViewCellDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UITableView* _tbl;
    NSMutableArray *photoArray;
    
     BOOL isChoosePhotoFromGalery;
}
-(void)showPhoto;
-(void)alert:(NSString*)message;
- (void)editViewToCamera;
- (void)editViewToPhotoAlbums;
- (void)removeImage:(NSString *)fileName;
@end
