//
//  NSString+NSStringUtil.m
//  Coolio
//
//  Created by hoehoe on 2013/10/10.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSString+NSStringUtil.h"

@implementation NSString (NSStringUtil)

#define kFontSize 17
#define chFontSize 14

+(float)stringWithHeight:(NSString*)text
{
    NSDictionary *attributesDictionary = @{NSFontAttributeName: [UIFont systemFontOfSize:kFontSize]};
    CGRect _frame = [text boundingRectWithSize:CGSizeMake(234, 999999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    CGSize _size = _frame.size;
    return _size.height;
}

+(float)chatStringWithHeight:(NSString*)text
{
    NSDictionary *attributesDictionary = @{NSFontAttributeName: [UIFont systemFontOfSize:chFontSize]};
    CGRect _frame = [text boundingRectWithSize:CGSizeMake(234, 999999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    CGSize _size = _frame.size;
    return _size.height;
}

@end
