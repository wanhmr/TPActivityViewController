###可自定义的分享界面, 使用方法如同 UIActivityViewController
#####效果如下图

![TPActivityViewControllerAnimate.gif](http://upload-images.jianshu.io/upload_images/1200356-76f8641e021444e3.gif?imageMogr2/auto-orient/strip)
- 由于系统的 UIActivityViewController 带了很多我不需要的分享 activity, 如果是第三方的activity, 由于不知道 type, 也就不能去掉 activity. 
- 如同 UIActivityViewController 一样, 扩展性极好, 没有自带activity(然后我也觉得没必要自带全家桶)
- 示例代码
```
 NSArray *items = @[[NSURL URLWithString:@"http://www.baidu.com"], [WKWebView new]];
    NSArray *activities = @[[TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [TOActivitySafari new], [QLRefreshActivity new], [QLRefreshActivity new], [QLRefreshActivity new], [QLRefreshActivity new], [QLRefreshActivity new]];
    // Do any additional setup after loading the view, typically from a nib.
    TPActivityViewController *activityVc = [[TPActivityViewController alloc]
                                            initWithMessage:@"TPActivityViewController"
                                            activityItems:items
                                            applicationActivities:activities];
    [self presentViewController:activityVc animated:YES completion:nil];
```
- TOActivitySafari 以及 QLRefreshActivity 都是继承自 UIActivity
###demo 地址
[请点击这里](https://github.com/wanhmr/TPActivityViewController.git)