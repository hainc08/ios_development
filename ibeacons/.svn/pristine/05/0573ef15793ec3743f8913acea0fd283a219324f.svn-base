//
//  VNPlayViewController.m
//  VNBeacon
//
//  Created by TrinhLD on 12/24/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "VNPlayViewController.h"
#import "AFHTTPRequestOperation.h"
#import "Reachability.h"
#import "VNContent.h"

@interface VNPlayViewController ()

@end

@implementation VNPlayViewController

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
    // Get content URL
    if ([self connectedToNetwork]) {
        NSURL *contentURL = self.content.contentURL;
        if ([contentURL.absoluteString hasSuffix:@"mp3"]) {
            [self getContentFromURL:contentURL type:kContentTypeMusic];
        } else if ([contentURL.absoluteString hasSuffix:@"pdf"]) {
            [self getContentFromURL:contentURL type:kContentTypePDF];
        } else if ([contentURL.absoluteString hasSuffix:@"jpg"] || [contentURL.absoluteString hasSuffix:@"png"]) {
            [self getContentFromURL:contentURL type:kContentTypeImage];
        } else if ([contentURL.absoluteString hasSuffix:@"mp4"]) {
            [self getContentFromURL:contentURL type:kContentTypeVideo];
        }

    } else {
        UIAlertView *alertNetwork = [[UIAlertView alloc] initWithTitle:@"Network" message:@"Check your network" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertNetwork show];
    }
}

- (void)getContentFromURL:(NSURL *)contentURL type:(NSInteger)contentType
{
    switch (contentType) {
        case kContentTypeImage:
        {
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
            _imageView.contentMode = UIViewContentModeScaleAspectFit;\
            // Get data from url
            NSData *data = [NSData dataWithContentsOfURL:contentURL];
            UIImage *image = [[UIImage alloc] initWithData:data];
            _imageView.image = image;
            _imageView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 22);
            [self.view addSubview:_imageView];
        }
            break;
        case kContentTypeMusic:
            // Play video
            _moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:contentURL];
            [_moviePlayerController.view setFrame:CGRectMake(0, 70, 320, 50)];
            _moviePlayerController.view.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 22);
            _moviePlayerController.view.backgroundColor = [UIColor clearColor];
            [self.view addSubview:_moviePlayerController.view];
            _moviePlayerController.fullscreen = YES;
            [_moviePlayerController play];
            break;
            
        case kContentTypePDF:
        {
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
            webView.scalesPageToFit = YES;
            webView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 22);
//            NSURL *targetURL = [NSURL URLWithString:@"http://www.education.gov.yk.ca/pdf/pdf-test.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:contentURL];
            [webView loadRequest:request];
            [self.view addSubview:webView];
        }
            break;
        case kContentTypeVideo:
            // Play video
            _moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:contentURL];
            [_moviePlayerController.view setFrame:CGRectMake(0, 70, 320, 270)];
            _moviePlayerController.view.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 22);
            [self.view addSubview:_moviePlayerController.view];
            _moviePlayerController.fullscreen = YES;
            [_moviePlayerController play];

            break;
            
        default:
            break;
    }
}

- (BOOL) connectedToNetwork
{
    Reachability* reachability = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        isInternet = NO;
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        isInternet = YES;
    }
    else if (remoteHostStatus == ReachableViaWiFi)
    { isInternet = YES;
        
    }
    return isInternet;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    if (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [_moviePlayerController.view setFrame:CGRectMake(0, 70, 320, 270)];
    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [_moviePlayerController.view setFrame:CGRectMake(0, 0, 480, 320)];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
