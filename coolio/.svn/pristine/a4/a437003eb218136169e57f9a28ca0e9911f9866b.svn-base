//
//  ProfilePictureViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/14.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "ProfilePictureViewController.h"

@interface ProfilePictureViewController ()

@end

@implementation ProfilePictureViewController

@synthesize imgProfile1;
@synthesize imgProfile2;
@synthesize imgProfile3;
@synthesize imgProfile4;
@synthesize imgProfile5;

#define IMAGE_SIZE 320.0f

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //[self.collectionView addSubview:self.refreshControl];

    
    /*
    CGRect imgProfile1Frame = self.imgProfile1.frame;
    CGRect imgProfile2Frame = self.imgProfile2.frame;
    CGRect imgProfile3Frame = self.imgProfile3.frame;
    CGRect imgProfile4Frame = self.imgProfile4.frame;
    CGRect imgProfile5Frame = self.imgProfile5.frame;
    
    imgProfile1Frame.origin.y = imgProfile1Frame.origin.y + 85.0f;
    imgProfile2Frame.origin.y = imgProfile2Frame.origin.y + 85.0f;
    imgProfile3Frame.origin.y = imgProfile3Frame.origin.y + 85.0f;
    imgProfile4Frame.origin.y = imgProfile4Frame.origin.y + 85.0f;
    imgProfile5Frame.origin.y = imgProfile5Frame.origin.y + 85.0f;
    
    self.imgProfile1.frame = imgProfile1Frame;
    self.imgProfile2.frame = imgProfile2Frame;
    self.imgProfile3.frame = imgProfile3Frame;
    self.imgProfile4.frame = imgProfile4Frame;
    self.imgProfile5.frame = imgProfile5Frame;
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y = viewFrame.origin.y + self.navigationController.navigationBar.frame.size.height;
    viewFrame.size.height = viewFrame.size.height - self.navigationController.navigationBar.frame.size.height;
    self.view.frame = viewFrame;
    */
    
    account = [[MyPicture alloc] init];
    
    /*
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//セクションの数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;//[collections count];
}

//セクション内の行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSLog(@"Collections count : %d", [collections count]);
    return 6;
}

//セルの描画
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"cell_pict";
    UICollectionViewCell *cell =
    [self.collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UICollectionViewCell alloc] init];
    }

    UIImageView* imageView = (UIImageView*)[cell viewWithTag:1];
    UILabel* label = (UILabel*)[cell viewWithTag:2];
    
    
    label.text = nil;
    imageView.image = nil;
    
    
    switch (indexPath.row) {
        case 0:
            //label.text = @"Tap to edit";
            imageView.userInteractionEnabled = YES;
            imageView.tag = 101;
            
            if([account getMyPicture1] != nil){
                imageView.image = [account getMyPicture1];
            }else{
                imageView.image = [UIImage imageNamed:@"pict_2013-02-12.jpg"];
            }
            self.imgProfile1 = imageView;
            break;
        case 1:
            //label.text = @"Tap to edit";
            imageView.userInteractionEnabled = YES;
            imageView.tag = 102;
            
            if([account getMyPicture2] != nil){
                imageView.image = [account getMyPicture2];
            }else{
                imageView.image = [UIImage imageNamed:@"pict_2013-02-12.jpg"];
            }
            self.imgProfile2 = imageView;
            break;
        case 2:
            //label.text = @"Tap to edit";
            imageView.userInteractionEnabled = YES;
            imageView.tag = 103;
            
            if([account getMyPicture3] != nil){
                imageView.image = [account getMyPicture3];
            }else{
                imageView.image = [UIImage imageNamed:@"pict_2013-02-12.jpg"];
            }
            self.imgProfile3 = imageView;
            break;
        case 3:
            //label.text = @"Tap to edit";
            imageView.userInteractionEnabled = YES;
            imageView.tag = 104;
            
            if([account getMyPicture4] != nil){
                imageView.image = [account getMyPicture4];
            }else{
                imageView.image = [UIImage imageNamed:@"pict_2013-02-12.jpg"];
            }
            self.imgProfile4 = imageView;
            break;
        case 4:
            break;
        case 5:
            //label.text = @"Tap to edit";
            imageView.userInteractionEnabled = YES;
            imageView.tag = 105;
            
            if([account getMyPicture5] != nil){
                imageView.image = [account getMyPicture5];
            }else{
                imageView.image = [UIImage imageNamed:@"pict_2013-02-12.jpg"];
            }
            self.imgProfile5 = imageView;
            break;
        default:
            break;
    }
    
    return cell;
}

//タップされた時
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    lastSelectedIndex = indexPath;
    //NSLog(@"%@", lastSelectedIndex);

    selectedImageView = NO;

    switch (indexPath.row) {
        case 0:
             selectedImageView = YES;
                tag = 101;
            break;
        case 1:
             selectedImageView = YES;
            tag = 102;
            break;
        case 2:
             selectedImageView = YES;
            tag = 103;
            break;
        case 3:
             selectedImageView = YES;
            tag = 104;
            break;
        case 4:
            break;
        case 5:
             selectedImageView = YES;
            tag = 105;
            break;
            
        default:
            break;
    }
    if(selectedImageView == YES){
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];  // 生成
            picker.delegate = self;  // デリゲートを自分自身に設定
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;  // 画像の取得先をカメラに設定
            picker.allowsEditing = NO;  // 画像取得後編集する
            [self presentViewController:picker animated:YES completion:nil];
        }
        
    }

    /*
    UITouch *touch = [[event allTouches] anyObject];
    if ( touch.view.tag == self.imgProfile1.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile2.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile3.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile4.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile5.tag){
        selectedImageView = YES;
    }
    */

    //NSLog(@"%d", tag);
    
    //NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheAccountDetail" object:mDict userInfo:nil];
    //[[NSNotificationCenter defaultCenter] postNotification:n];
}

/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MyReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyReusableView" forIndexPath:indexPath];
    //return headerView;
    //NSLog(@"viewForSupplementaryElementOfKind");
    
    if(![self.collections isEqual:[NSNull null]]){
        if([self.collections count] > OFFSET_VALUE && [self.collections count] % OFFSET_VALUE == 0){
            int nextPageIndex = [self.collections count] + 1;
            [self loadNextPage:nextPageIndex];
        }
    }
    return headerView;
}
*/

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    selectedImageView = NO;
    UITouch *touch = [[event allTouches] anyObject];
    if ( touch.view.tag == self.imgProfile1.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile2.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile3.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile4.tag){
        selectedImageView = YES;
    }
    if ( touch.view.tag == self.imgProfile5.tag){
        selectedImageView = YES;
    }
    tag = touch.view.tag;
    //NSLog(@"%d", tag);
    if(selectedImageView == YES){
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];  // 生成
            picker.delegate = self;  // デリゲートを自分自身に設定
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;  // 画像の取得先をカメラに設定
            picker.allowsEditing = NO;  // 画像取得後編集する
            [self presentViewController:picker animated:YES completion:nil];
        }

    }
}
*/

-(void)imagePickerController:(UIImagePickerController*)picker
       didFinishPickingImage:(UIImage*)image editingInfo:(NSDictionary*)editingInfo
{
    CGSize size;
    size.height = IMAGE_SIZE;
    size.width  = IMAGE_SIZE;
    
    image = [ImageResizable imageWithImage:image scaledToSizeWithSameAspectRatio:size];
    switch (tag) {
        case 101:
            self.imgProfile1.image = image;
            [account setMyPicture1:image];
            break;
        case 102:
            self.imgProfile2.image = image;
            [account setMyPicture2:image];
            break;
        case 103:
            self.imgProfile3.image = image;
            [account setMyPicture3:image];
            break;
        case 104:
            self.imgProfile4.image = image;
            [account setMyPicture4:image];
            break;
        case 105:
            self.imgProfile5.image = image;
            [account setMyPicture5:image];
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_donePush:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
