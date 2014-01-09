//
//  MyPicture.m
//  Coolio
//
//  Created by hoehoe on 2013/04/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyPicture.h"

@implementation MyPicture
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyPicture alloc] init];
    }
    
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }

    UIImage* defaultImage = [UIImage imageNamed:@"pict_2013-02-12.jpg"];
    
    if([self.defaultObject valueForKey:@"mypicture1"] == nil){
        [self.defaultObject setValue:UIImagePNGRepresentation(defaultImage) forKey:@"mypicture1"];
        [self.defaultObject synchronize];
    }

    if([self.defaultObject valueForKey:@"mypicture2"] == nil){
        [self.defaultObject setValue:UIImagePNGRepresentation(defaultImage) forKey:@"mypicture2"];
        [self.defaultObject synchronize];
    }
    
    if([self.defaultObject valueForKey:@"mypicture3"] == nil){
        [self.defaultObject setValue:UIImagePNGRepresentation(defaultImage) forKey:@"mypicture3"];
        [self.defaultObject synchronize];
    }
    
    if([self.defaultObject valueForKey:@"mypicture4"] == nil){
        [self.defaultObject setValue:UIImagePNGRepresentation(defaultImage) forKey:@"mypicture4"];
        [self.defaultObject synchronize];
    }
    
    if([self.defaultObject valueForKey:@"mypicture5"] == nil){
        [self.defaultObject setValue:UIImagePNGRepresentation(defaultImage) forKey:@"mypicture5"];
        [self.defaultObject synchronize];
    }

    return self;
}

- (void)setMyPicture1:(UIImage *)image
{
    [self.defaultObject setValue:UIImagePNGRepresentation(image) forKey:@"mypicture1"];
    [self.defaultObject synchronize];
}
- (UIImage *)getMyPicture1{ return [UIImage imageWithData:[self.defaultObject valueForKey:@"mypicture1"]];}

- (void)setMyPicture2:(UIImage *)image
{
    [self.defaultObject setValue:UIImagePNGRepresentation(image) forKey:@"mypicture2"];
    [self.defaultObject synchronize];
}
- (UIImage *)getMyPicture2{ return [UIImage imageWithData:[self.defaultObject valueForKey:@"mypicture2"]]; }

- (void)setMyPicture3:(UIImage *)image
{
    [self.defaultObject setValue:UIImagePNGRepresentation(image) forKey:@"mypicture3"];
    [self.defaultObject synchronize];
}
- (UIImage *)getMyPicture3{ return [UIImage imageWithData:[self.defaultObject valueForKey:@"mypicture3"]]; }

- (void)setMyPicture4:(UIImage *)image
{
    [self.defaultObject setValue:UIImagePNGRepresentation(image) forKey:@"mypicture4"];
    [self.defaultObject synchronize];
}
- (UIImage *)getMyPicture4{ return [UIImage imageWithData:[self.defaultObject valueForKey:@"mypicture4"]]; }

- (void)setMyPicture5:(UIImage *)image
{    
    [self.defaultObject setValue:UIImagePNGRepresentation(image) forKey:@"mypicture5"];
    [self.defaultObject synchronize];
}
- (UIImage *)getMyPicture5{ return [UIImage imageWithData:[self.defaultObject valueForKey:@"mypicture5"]]; }

-(void)sync:(NSDictionary *)_myInfo
{
    
    MyPicture* picture = [[MyPicture alloc] init];
    for(int i=0; i<5; i++){
        NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
        [appendIconUrlString appendString:URLSTRING];
        [appendIconUrlString appendString:@"icons/"];
        
        switch (i) {
            case 0:
                [appendIconUrlString appendFormat:@"%@", [_myInfo valueForKey:@"picture1"]];
                break;
            case 1:
                [appendIconUrlString appendFormat:@"%@", [_myInfo valueForKey:@"picture2"]];
                break;
            case 2:
                [appendIconUrlString appendFormat:@"%@", [_myInfo valueForKey:@"picture3"]];
                break;
            case 3:
                [appendIconUrlString appendFormat:@"%@", [_myInfo valueForKey:@"picture4"]];
                break;
            case 4:
                [appendIconUrlString appendFormat:@"%@", [_myInfo valueForKey:@"picture5"]];
                break;
            default:
                break;
        }
        
        
        //NSLog(@"IconURL: %@", appendIconUrlString);
        
        NSURL *url = [NSURL URLWithString:appendIconUrlString];
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        UIImage* img = [[UIImage alloc] initWithData:imgData];
        switch (i) {
            case 0:
                [picture setMyPicture1:img];
                break;
            case 1:
                [picture setMyPicture2:img];
                break;
            case 2:
                [picture setMyPicture3:img];
                break;
            case 3:
                [picture setMyPicture4:img];
                break;
            case 4:
                [picture setMyPicture5:img];
                break;
            default:
                break;
        }
        
    }

}
-(void)reset
{

}

@end
