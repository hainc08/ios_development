//
//  CSMapAnnotation.m
//  mapLines
//
//  Created by Craig on 5/15/09.
//  Copyright 2009 Craig Spitzkoff. All rights reserved.
//

#import "CSMapAnnotation.h"


@implementation CSMapAnnotation

@synthesize coordinate     = _coordinate;
@synthesize annotationType = _annotationType;
@synthesize url            = _url;

//@synthesize title          = _title;

@synthesize userInfo;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate 
		  annotationType:(CSMapAnnotationType) annotationType
				   userData:(UserInfo *)user
{
	self = [super init];
	_coordinate = coordinate;
	_annotationType = annotationType;
    userInfo = user;
    NSLog(@"user nickname =%@", userInfo.nickname);
	
	return self;
}

- (NSString *)title
{
	return @"  ";
}
- (NSString *)subtitle
{
	NSString* subtitle = nil;
	
		subtitle = [NSString stringWithFormat:@"%lf, %lf", _coordinate.latitude, _coordinate.longitude];
	
	return subtitle;
}

-(void) dealloc
{
	//[_title    release];
    
	[_userData release];
	[_url      release];
	
	[super dealloc];
}

@end
