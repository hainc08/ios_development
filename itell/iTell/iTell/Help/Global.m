//
//  Global.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Global.h"
#import "ITMarco.h"
#import "UIApplication+UIID.h"
#import <QuartzCore/QuartzCore.h>

static NSString *g_UserUUID = nil;
static Global *instanceGlobal;

@implementation Global
@synthesize latestItellTime;
@synthesize isItelling;
@synthesize user;


-(id)init{
    self = [super init];
    if (self) {
        latestItellTime = 0;
        user = [[UserData alloc] init];
        //user.userID = 62;
    }
    return self;
}
+(Global*)shareGlobal{
    if (instanceGlobal == nil) {
        instanceGlobal = [[Global alloc] init];
    }
    return instanceGlobal;
}

-(void)resetItellTime{
    ITINFO_FUNC
    latestItellTime = [[NSDate date] timeIntervalSince1970];
}

+ (NSString*) getUserUUID {
    if (g_UserUUID == nil) {
        g_UserUUID = [[NSString alloc] initWithString:[[UIApplication sharedApplication] uniqueInstallationIdentifier]];
    }
    [Global shareGlobal].user.uuid = g_UserUUID;//@"672c6ef525d60850945250c6dade17e8";//
    return g_UserUUID;
}

-(void)dealloc{
    [user release];
    [super dealloc];
    instanceGlobal = nil;
}


//Thap added
+ (void) saveImageFromURL:(NSString *)fileName url:(NSString*)fileURL {	
	NSString* documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if(![fileName isKindOfClass:[NSNull class]]) {
        if ([fileName rangeOfString:@"png"].location != NSNotFound) { 
            NSArray *arrStrings = [[fileName lastPathComponent] componentsSeparatedByString: @"."];
            NSString *fileType = [arrStrings objectAtIndex:([arrStrings count] - 1)];
            NSString *basename = [fileName substringToIndex:(fileName.length - fileType.length - 1)];
            NSString *name_1x = fileName;
            NSString *name_2x = [basename stringByAppendingString:[NSString stringWithFormat:@"@2x.%@",fileType]];
            
            NSString* file = [documentsDirectory stringByAppendingPathComponent:fileName];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            
            if(![fileManager fileExistsAtPath:file]) {		
                
                // Get an image from the URL below
                UIImage *image2x = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]]];
                
                /* Resize 2x to 1x image  */
                CGSize newSize = CGSizeMake(image2x.size.width/2, image2x.size.height/2);
                UIImage *image1x = [self resizeImage:image2x size:newSize];
                
                NSString *pngFilePath2x = [[documentsDirectory stringByAppendingString:@"/"] stringByAppendingString:name_2x];
                NSString *pngFilePath1x = [[documentsDirectory stringByAppendingString:@"/"] stringByAppendingString:name_1x];
                
                NSData *data2x = [NSData dataWithData:UIImagePNGRepresentation(image2x)];
                [data2x writeToFile:pngFilePath2x atomically:YES];
                
                NSData *data1x = [NSData dataWithData:UIImagePNGRepresentation(image1x)];
                [data1x writeToFile:pngFilePath1x atomically:YES];
                
                [image2x release];
            } 
        }
    }
}


/* Resize image   */
+ (UIImage *)resizeImage:(UIImage *)image size:(CGSize)newSize {
	
	//CGSize newSize = CGSizeMake(96, 32);
	UIGraphicsBeginImageContext( newSize );
	[image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;	
}

+ (void)setValueState:(BOOL)flag withKey:(NSString *)strKey {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:flag forKey:strKey];
}
+ (BOOL)getValueState:(NSString *)strKey {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults]; 
    BOOL flag = [prefs boolForKey:strKey];
    return flag;
}
- (void)moveToTest:(UITableViewCell *)cell fromPoint:(CGPoint)pos1 toPoint:(CGPoint)pos2 {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fromValue	= [NSValue valueWithCGPoint:pos1];
    anim.toValue	= [NSValue valueWithCGPoint:pos2];
    anim.duration	= 1.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [cell.layer addAnimation:anim forKey:@"animation"];
    
}
- (void)viewCellSelected:(UITableViewCell *)tbCell indexCell:(int)index withArrCells:(NSArray *)arrCells{
    UITableViewCell *cellSelected  = [arrCells objectAtIndex:index];
    CGPoint point1 = CGPointMake(cellSelected.frame.origin.x + cellSelected.frame.size.width/2, cellSelected.frame.origin.y + cellSelected.frame.size.height/2);
    CGPoint point2 = CGPointMake(cellSelected.frame.origin.x + cellSelected.frame.size.width/2 - 500, cellSelected.frame.origin.y + cellSelected.frame.size.height/2);
    [self moveToTest:cellSelected fromPoint:point1 toPoint:point2];
    if (index > 0) {
        for (int i = index + 1; i < [arrCells count]; i++) {
            UITableViewCell *cell = [arrCells objectAtIndex:i];
            CGPoint point1 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2);
            CGPoint point2 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2 + 300);
            [self moveToTest:cell fromPoint:point1 toPoint:point2];
        }
        for (int i = 0; i < index; i++) {
            UITableViewCell *cell = [arrCells objectAtIndex:i];
            CGPoint point1 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2);
            CGPoint point2 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2 - 300);
            [self moveToTest:cell fromPoint:point1 toPoint:point2];
        }
    }else {
        for (int i = 1; i < [arrCells count]; i++) {
            UITableViewCell *cell = [arrCells objectAtIndex:i];
            CGPoint point1 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2);
            CGPoint point2 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2 + 300);
            [self moveToTest:cell fromPoint:point1 toPoint:point2];
        }
    }
}
@end
