//
//  TPAlertViewController.m
//  WK
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "TPActivityViewController.h"
#import "TPActivityView.h"
#import "UIActivity+TPActivity.h"
#import "TPActivityViewTheme.h"
@interface TPActivityViewController ()
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray *activityItems;
@property (nonatomic, copy) NSArray<__kindof UIActivity *> *applicationActivities;
@property (nonatomic, strong) TPActivityViewTheme *theme;
@end

@implementation TPActivityViewController

#pragma mark - init
- (instancetype)initWithMessage:(NSString *)message activityItems:(NSArray *)activityItems applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities {
    return [self initWithMessage:message activityItems:activityItems applicationActivities:applicationActivities theme:nil];
}

- (instancetype)initWithMessage:(NSString *)message activityItems:(NSArray *)activityItems applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities theme:(TPActivityViewTheme *)theme {
    self = [super init];
    if (self) {
        _message = message;
        _activityItems = activityItems.copy;
        _applicationActivities = applicationActivities.copy;
        if (theme) {
             _theme = theme;
        }else {
            _theme = [TPActivityViewTheme defaultActivityViewTheme];
        }
    }
    return self;
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TPActivityView *alertView = [TPActivityView viewWithMessage:self.message activityItems:self.activityItems applicationActivities:self.applicationActivities theme:self.theme];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:alertView];
    self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, [alertView preferHeight]);
    __weak typeof(self) weakSelf = self;
    alertView.didSelectItemAtIndexPath = ^(NSIndexPath *indexPath, BOOL isCancel){
        if (isCancel) {
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }
    };
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(activityDidFinish:) name:kActivityDidFinishNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma makr - noti 
- (void)activityDidFinish:(NSNotification *)notification {
    if ([(NSNumber *)notification.object boolValue]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - 
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [UIApplication sharedApplication].statusBarStyle;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
