//
//  AlbumViewController.m
//  iTell
//
//  Created by Thap on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AlbumViewController.h"
#import "Global.h"

#define kNumberPhoto 3


@implementation AlbumViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showPhoto];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return 1;
    } else {
        return [photoArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1) {
        ProfileSettingCellViewController *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[ProfileSettingCellViewController alloc] init];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.scroll setContentSize:CGSizeMake(321, 65)];
        }
        cell.delegate = self;
        cell.cellIndex = indexPath.row;
        cell.textLb.text = @"画像追加";
        cell.iconImageView.image = [UIImage imageNamed:@"add_icon.png"];
        cell.cellIndex = indexPath.row;
        
        return cell;

    } else {
    
        AlbumViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[AlbumViewCell alloc] init];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.scroll setContentSize:CGSizeMake(321, 65)];
        }
        cell.delegate = self;
        cell.cellIndex = indexPath.row;
        cell.imageViewOverlay.image = [photoArray objectAtIndex:indexPath.row];
        return cell;

    }
  }

-(void)cellSelected:(NSInteger)cellIndex{
    if ([photoArray count] < 3) {
        NSMutableArray *stringArray = [[NSMutableArray alloc] initWithCapacity:3];
        NSString *str1 = @"写真を撮影する";
        NSString *str2 = @"ギャラリーから選択";
        NSString *str3 = @"キャンセル";
        [stringArray addObject:str1];
        [stringArray addObject:str2];
        [stringArray addObject:str3];
        UITableAlert* alertCamera = [[[UITableAlert alloc] initWithRecords:stringArray]autorelease];
        [alertCamera setTag:1];
        alertCamera.delegate = self;
        alertCamera.isPicker = YES;
        [alertCamera show];
        //[alertCamera release]; 
        [stringArray release];
    }else{
        /*show alert can't capture photo anymore*/
        [self alert:@"フォト登録は 3つまでです。\nフォトを追加する前に既に存在するフォトを削除して下さい。"];
    }

}

-(void)alert:(NSString*)message
{
	UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"" 
													  message:message delegate:self cancelButtonTitle:@"OK"
											otherButtonTitles:nil, nil]; 
	[myAlert show]; 
	[myAlert release];    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {    
    if(alertView.tag == 1)
    {
        if(buttonIndex == 0){
            [self performSelectorInBackground:@selector(startBusyView) withObject:nil];//anhvt
            [self editViewToCamera];
        }
        else if(buttonIndex == 1) {
            [self performSelectorInBackground:@selector(startBusyView) withObject:nil];//anhvt
            [self editViewToPhotoAlbums];
        }
        else {
            
            return;
        }
    }
}
- (void)editViewToCamera{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //[imagePicker setTitle:@"Camera"];
	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
	imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    [self presentModalViewController:imagePicker animated:YES];
    [imagePicker release]; 
}
- (void)editViewToPhotoAlbums{
    isChoosePhotoFromGalery = TRUE;
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //[imagePicker setTitle:@"PhotoAlbums"];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES]; 
    [imagePicker release]; 
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *photo = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //save to photo album
    if (!isChoosePhotoFromGalery) {
        UIImageWriteToSavedPhotosAlbum(photo, nil, nil, nil);
        isChoosePhotoFromGalery = FALSE;
    }
    //save to document directory
    NSInteger imageIndex = [photoArray count];
    NSString* imageName = [NSString stringWithFormat:@"photo%d.jpg",imageIndex];
    NSString  *jpgPath = PATH_SANDBOX(imageName);
    [UIImageJPEGRepresentation(photo, 1.0) writeToFile:jpgPath atomically:YES];
    //add to photo array
    [photoArray addObject:photo];
    [_tbl reloadData];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissModalViewControllerAnimated:YES];
    
    
}

-(void)imageCellSelected:(NSInteger)cellIndex{
    [photoArray removeObjectAtIndex:cellIndex];
    [_tbl reloadData];
}

- (void)removeImage:(NSString *)fileName{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0], fileName];
    if([fileManager fileExistsAtPath:filePath]){
        [fileManager removeItemAtPath:filePath error:NULL];
    }    
}

-(void)showPhoto{

    NSFileManager *fileManager = [NSFileManager defaultManager];
    for (NSInteger i = 0; i < kNumberPhoto; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"photo%d.jpg", i];
        if([fileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0], imageName]]){
            UIImage *img = IMAGE_SANDBOX(imageName);
            [photoArray addObject:img];
        }
    }    
    [_tbl reloadData];
}
@end
