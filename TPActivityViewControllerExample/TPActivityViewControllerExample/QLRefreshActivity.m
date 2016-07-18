//
//  QLRefreshActivity.m
//  QLChat
//
//  Created by Tpphha on 16/7/16.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "QLRefreshActivity.h"
#import "UIImage+TOWebViewControllerIcons.h"
#import <WebKit/WebKit.h>
NSString *const QLActivityTypeRefresh = @"au.com.timoliver.QLActivityTypeRefresh";
@interface QLRefreshActivity ()
@property (nonatomic, weak) WKWebView *webView;
@end
@implementation QLRefreshActivity
#pragma mark - Activity Display Properties -
- (NSString *)activityType
{
    return QLActivityTypeRefresh;
}

- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"刷新", @"TOWebViewControllerLocalizable", @"Open in Safari Action");
}

- (UIImage *)activityImage
{
    return [UIImage TOWebViewControllerIcon_refreshButtonWithAttributes:nil];
}

+(UIActivityCategory)activityCategory
{
    // 决定在UIActivityViewController中显示的位置，最上面是AirDrop，中间是Share，下面是Action
    return UIActivityCategoryAction;
}


#pragma mark - Activity Action Handlers -
- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    //Grab the first URL in the list
    for (id item in activityItems) {
        if ([item isKindOfClass:[WKWebView class]]) {
            self.webView = (WKWebView *)item;
            break;
        }
    }
}

- (void)performActivity
{
    if (self.webView == nil) {
        [self activityDidFinish:NO];
        return;
    }
    
    [self.webView reload];
    [self activityDidFinish:YES];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    //Check to see if there is an NSURL in the provided items
    BOOL containsURL = NO;
    for (id item in activityItems) {
        if ([item isKindOfClass:[WKWebView class]]) {
            containsURL = YES;
            break;
        }
    }
    
    return containsURL;
}


@end
