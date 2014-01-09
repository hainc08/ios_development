//
//  ProfilePictureViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/14.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPicture.h"
#import "ImageResizable.h"
#import "UIViewController+PassLock.h"

@interface ProfilePictureViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSInteger tag;
    BOOL selectedImageView;
    MyPicture* account;
    NSIndexPath* lastSelectedIndex;
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (weak, nonatomic)  UIImageView *imgProfile1;
@property (weak, nonatomic)  UIImageView *imgProfile2;
@property (weak, nonatomic)  UIImageView *imgProfile3;
@property (weak, nonatomic)  UIImageView *imgProfile4;
@property (weak, nonatomic)  UIImageView *imgProfile5;


- (IBAction)btn_donePush:(id)sender;

@end
