//
//  UIActivity+TPActivity.m
//  QLChat
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "UIActivity+TPActivity.h"
#import <objc/runtime.h>
NSString *const kActivityDidFinishNotification = @"kActivityDidFinishNotification";
@implementation UIActivity (TPActivity)

+ (void)load {
    [self swizzleInstanceMethod:@selector(activityDidFinish:) with:@selector(tp_activityDidFinish:)];
}

// activity must call this when activity is finished
- (void)tp_activityDidFinish:(BOOL)completed {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completed) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kActivityDidFinishNotification object:@(completed)];
        }
    });
    [self tp_activityDidFinish:completed];
}


+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

@end
