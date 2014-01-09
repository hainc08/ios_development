//
//  Util.h
//
//  Created by Vnext-imac on 10/24/13.
//  Copyright (c) 2013 TrinhLD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "NTAppDelegate.h"

@interface Util : NSObject

@property (strong, nonatomic) MBProgressHUD *progressView;

+ (Util *)sharedUtil;
+ (NTAppDelegate *)appDelegate;

//Alert functions
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title;
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title andDelegate:(id)delegate;
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title delegate:(id)delegate andTag:(NSInteger)tag;
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle delegate:(id)delegate andTag:(NSInteger)tag;

//Loading view functions
- (void)showLoadingView;
- (void)showLoadingViewWithTitle:(NSString *)title;
- (void)hideLoadingView;

//NSUserDefaults functions
+ (void)setValue:(id)value forKey:(NSString *)key;
+ (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
+ (void)setObject:(id)obj forKey:(NSString *)key;
+ (id)valueForKey:(NSString *)key;
+ (id)valueForKeyPath:(NSString *)keyPath;
+ (id)objectForKey:(NSString *)key;
+ (void)removeObjectForKey:(NSString *)key;

//JSON functions
+ (id)convertJSONToObject:(NSString*)str;
+ (NSString *)convertObjectToJSON:(id)obj;
+ (id)getJSONObjectFromFile:(NSString *)file;

//Other stuff
+ (UIImage *)imageWithView:(UIView *)view;

// Resize image
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (CGPoint)convertCGPoint:(CGPoint)point1 fromRect1:(CGSize)rect1 toRect2:(CGSize)rect2;
// http://stackoverflow.com/questions/538041/uiimagepickercontroller-camera-preview-is-portrait-in-landscape-app
+ (UIImage *)scaleAndRotateImage:(UIImage *)image;

// Shuffle array
// Algorithm :http://en.wikipedia.org/wiki/Fisher-Yates_shuffle
+ (NSMutableArray *)shuffleArray:(NSMutableArray *)inputArray;

@end











