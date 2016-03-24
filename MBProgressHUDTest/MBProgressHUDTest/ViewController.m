//
//  ViewController.m
//  MBProgressHUDTest
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>
@interface ViewController ()<MBProgressHUDDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self MBProgressAddTextTest];
}
#pragma mark==不加字的progress
-(void)MBProgressTest
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
       sleep(1);//睡眠一秒，就是让Progress持续显示1秒
       dispatch_async(dispatch_get_main_queue(), ^{
           [MBProgressHUD hideAllHUDsForView:self.view animated:YES];//影藏Progress
       });
   });
}
#pragma mark==给progress添加字
-(void)MBProgressAddTextTest
{

   MBProgressHUD *pro= [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    /*
     设置progress的展示样式
     
     MBProgressHUDModeIndeterminate,==默认的progress
     
     MBProgressHUDModeDeterminate,==像一个饼状图的progress
     
     MBProgressHUDModeDeterminateHorizontalBar,==一个横向的进度条
     
     MBProgressHUDModeAnnularDeterminate,==一个圆环状的progress
     
     MBProgressHUDModeCustomView,===自定义的progress
    
     MBProgressHUDModeText==只有一个label的progress
     
     PS:这些样式的Progress都可以显示Label和detailsLabel，只要给了labelText值就会显示，不给就不会显示
     */
    pro.mode=MBProgressHUDModeIndeterminate;
    pro.labelText=@"正在加载。。。。";
    pro.detailsLabelText=@"123";
    /*
    设置progress消失的动画样式
    
    MBProgressHUDAnimationFade,==变淡
    
    MBProgressHUDAnimationZoom,==缩小，变淡
    MBProgressHUDAnimationZoomOut = MBProgressHUDAnimationZoom,
    MBProgressHUDAnimationZoomIn==放大，变淡
     */
    pro.animationType=MBProgressHUDAnimationZoomIn;
    
    pro.delegate=self;//设置progress的代理方法，只有一个代理方法
    
    
    [pro hide:YES afterDelay:3];//设置progress3秒之后影藏
}
#pragma mark==MBProgressHUDDelegate
/**progress已经消失的时候调用*/
-(void)hudWasHidden:(MBProgressHUD *)hud
{
    NSLog(@"progress已经消失的时候调用");
}
@end
