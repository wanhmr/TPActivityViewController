//
//  UIViewController+TPActivity.m
//  WK
//
//  Created by Tpphha on 16/7/18.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "UIViewController+TPActivity.h"
#import <objc/runtime.h>
#import "TPActivityPresentationController.h"
#import "TPActivityViewController.h"
@implementation UIViewController (TPActivity)

+ (void)load {
    [self swizzleInstanceMethod:@selector(presentViewController:animated:completion:) with:@selector(tp_presentViewController:animated:completion:)];
}

- (void)tp_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0) {
    if([viewControllerToPresent isKindOfClass:[TPActivityViewController class]]){
        TPActivityPresentationController *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
        presentationController = [[TPActivityPresentationController alloc] initWithPresentedViewController:viewControllerToPresent presentingViewController:self];
        viewControllerToPresent.transitioningDelegate = presentationController;
        [self tp_presentViewController:viewControllerToPresent animated:flag completion:completion];
    }else {
        [self tp_presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
    
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
