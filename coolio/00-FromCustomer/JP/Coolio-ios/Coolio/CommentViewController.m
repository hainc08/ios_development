//
//  CommentViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController
@synthesize cell_title;
@synthesize cell_comment;
@synthesize lbl_comment;
@synthesize txt_comment;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self openPasscodeView];
    account = [[MyProfiles alloc] init];

    self.txt_comment.text = [account getCommentProfile];
    [self.txt_comment becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setCommentProfile:self.txt_comment.text];
        });
    }
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    switch (indexPath.row) {
        case 0:
            cell = cell_title;
            break;
        case 1:
            cell = cell_comment;
            break;
        default:
            break;
    }
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
- (void)keyboardWillShow:(NSNotification*)notification
{
    //NSLog(@"Call UIKeyboardDidShowNotification:");
    //CGFloat toolbarHeight = self.toolbar.frame.size.height;
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat tableHeight = self.tableView.frame.size.height;
    CGFloat cellHeight = self.cell_comment.frame.size.height;
    
    NSDictionary *info = [notification userInfo];
    NSValue *keyValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [keyValue CGRectValue].size;
    
    
    
    NSInteger textViewSize = viewHeight - tableHeight + cellHeight - keyboardSize.height - 2;// - toolbarHeight;
    //    NSLog(@"self.view.frame.size.height: %f", self.view.frame.size.height);
    //    NSLog(@"TextViewHeight: %d", textViewSize);
    //    NSLog(@"キーボードサイズ: %0f", keyboardSize.height);
    //    NSLog(@"toolbarHeight: %0f", toolbarHeight);
    //    NSLog(@"navibarHeight: %0f", navigationHeight);
    
    
    //NSLog(@"mode change");
    UITextInputMode *tinput = [UITextInputMode currentInputMode];
    //NSLog(@"mode = %@",[tinput primaryLanguage]);
    if ([[tinput primaryLanguage] isEqualToString:@"ja-JP"] ) {
        //NSLog(@"日本語入力キーボード");
        //120
        self.txt_comment.frame = CGRectMake(0, cellHeight, 320, textViewSize);
    }else if([[tinput primaryLanguage] isEqualToString:@"en-US"] ){
        //NSLog(@"英語入力キーボード");
        //160
        self.txt_comment.frame = CGRectMake(0, cellHeight, 320, textViewSize);
    }else{
        //NSLog(@"ios4");
        //self.view.frame = CGRectMake(0, -8 + 44 + 36, 320, 167);
    }
    
    
}
*/

@end
