//
//  ViewController.m
//  TPActivityViewControllerExample
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "ViewController.h"
#import "TPActivityViewController.h"
#import "TOActivitySafari.h"
#import "QLRefreshActivity.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (IBAction)buttonAction:(id)sender {
    NSArray *items = @[[NSURL URLWithString:@"http://www.baidu.com"], [WKWebView new]];
    NSArray *activities = @[[TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [QLRefreshActivity new], [QLRefreshActivity new], [QLRefreshActivity new], [QLRefreshActivity new], [QLRefreshActivity new]];
    // Do any additional setup after loading the view, typically from a nib.
    TPActivityViewController *activityVc = [[TPActivityViewController alloc]
                                            initWithMessage:@"TPActivityViewController"
                                            activityItems:items
                                            applicationActivities:activities];
    [self presentViewController:activityVc animated:YES completion:nil];
}

@end
