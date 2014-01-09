//
//  BlocksViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "BlocksViewController.h"

@interface BlocksViewController ()

@end

@implementation BlocksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    account = [[MyProfiles alloc] init];
    myId = [account getEmailProfile];
    coolio = [[CoolioWebService alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyGetBlockList:) name:@"ToNotifyGetBlockList" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyBlockRemove:) name:@"ToNotifyBlockRemove" object:nil];
    //
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [coolio getBlockList:myId];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [blockList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIImageView* imgIcon = (UIImageView *) [cell viewWithTag:1];
    UILabel* lbl_nickName = (UILabel *) [cell viewWithTag:2];
    UITextView* contentTextView = (UITextView *)[cell viewWithTag:3];
    
    NSDictionary* userDict = [blockList[indexPath.row] mutableCopy];
    //NSLog(@"%@", userDict);
    //userDict = [userDict valueForKey:@"user"];
    
    UserProfile* users = [[UserProfile alloc] init];
    users.userProfileInfo = userDict;
    
    lbl_nickName.text = [users getNickName];
    /*
     名前
     年齢：身長：体重
     目的
     */
    
    contentTextView.text = [users getTableViewFormatValues];
    //NSLog(@"%@", userDict);
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        //UIImage* img = [self pictures:userDict pictName:@"picture1"];
        
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            [imgIcon setImageWithURL:[self picturesURL:userDict pictName:@"picture1"] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
            //imgIcon.image = img;
        });
    });
    return cell;
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
     // Return NO if you do not want the specified item to be editable.
     return YES;
 }

 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         // Delete the row from the data source
         NSDictionary* userDict = blockList[indexPath.row];
         //userDict = [userDict valueForKey:@"user"];
         NSString* userId = [userDict valueForKey:@"email"];

         [coolio sendBlockOff:myId blockId:userId];
         [blockList removeObjectAtIndex:indexPath.row];
         
         [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
         //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     }
     //else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     //}
 }

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(UIImage *)pictures:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    NSURL *url = [NSURL URLWithString:appendIconUrlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    return img;
}

-(NSURL *)picturesURL:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    return [NSURL URLWithString:appendIconUrlString];
}

-(void)toNotifyBlockRemove:(NSNotification *)notification{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        [self.tableView reloadData];
    });
}
-(void)toNotifyGetBlockList:(NSNotification *)notification
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        blockList = [[notification object] mutableCopy];
        [self.tableView reloadData];
    });
    //NSLog(@"%@", blockList);
}

- (IBAction)editButton_push:(id)sender {
    if(isEditing == NO){
        [self.tableView setEditing:YES animated:YES];
        isEditing = YES;
        //"BLOCK_VIEW_EDIT_BUTTON_EDITABLE" = "Edit";
        //"BLOCK_VIEW_EDIT_BUTTON_CANCEL" = "Cancel";
        [self.editButton setTitle:NSLocalizedString(@"BLOCK_VIEW_EDIT_BUTTON_CANCEL", nil)];
        [self.editButton setStyle:UIBarButtonItemStyleDone];
    }else{
        [self.tableView setEditing:NO animated:YES];
        isEditing = NO;
        [self.editButton setTitle:NSLocalizedString(@"BLOCK_VIEW_EDIT_BUTTON_EDITABLE", nil)];
        [self.editButton setStyle:nil];
    }
    
}

- (IBAction)btn_donePush:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
