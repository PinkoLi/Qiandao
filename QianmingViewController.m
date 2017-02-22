//
//  QianmingViewController.m
//  Qiandao
//
//  Created by PinkoLi on 16/4/5.
//  Copyright © 2016年 ck. All rights reserved.
//

#import "QianmingViewController.h"
#import "MyView.h"
#import "MBProgressHUD+YS.h"
@interface QianmingViewController ()
@property (strong,nonatomic)  MyView *drawView;
@end

@implementation QianmingViewController
//保存线条颜色
static NSMutableArray *colors;
static NSMutableArray *pointArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    colors=[[NSMutableArray alloc]initWithObjects:[UIColor greenColor],[UIColor blueColor],[UIColor redColor],[UIColor blackColor],[UIColor whiteColor], nil];
//    CGRect viewFrame=self.view.frame;
//    
//    CGPoint point = self.view.frame.origin;
//    point.x=point.x+220;
//    point.y=point.y;
//    
//    CGSize size = self.view.frame.size;
//    size.width = size.width-208;
//    size.height = size.height-410;
//    
//    viewFrame.size=size;
//    
//    viewFrame.origin =point;
//    
    

    self.drawView=[[MyView alloc]initWithFrame:CGRectMake(0, 0, 768, 900)];
    [self.drawView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: self.drawView];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //指定新建文件夹路径
    NSString *imageDocPath = [documentPath stringByAppendingPathComponent:@"SignIn"];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"%@",imageDocPath);
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
   
    //_groups=[user objectForKey:@"name"];
    //保存图片的路径
    self.imagePath = [imageDocPath stringByAppendingPathComponent: [user objectForKey:@"name"]];
    NSLog(@"--------------%@",_imagePath);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)go:(id)sender {
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    self.imagePath=[[[self.imagePath stringByAppendingString:@"__" ]stringByAppendingString:strDate ] stringByAppendingString:@".jpg"];
    NSLog(@"-----------------%@", self.imagePath);
    
    UIGraphicsBeginImageContext(self.drawView.bounds.size);
    [self.drawView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    for (int i=1;i<16;i++) {
        if ((i>=1&&i<=5)||(i>=11&&i<=14)) {
            continue;
        }
        UIView *view=[self.view viewWithTag:i];
        view.hidden=NO;
    }
    NSLog(@"----------%@",self.drawView.layer);
    //截屏成功
//    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Save OK" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    NSData *data;
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(image)) {
        //返回为png图像。
        data = UIImagePNGRepresentation(image);
    }else {
        //返回为JPEG图像。
        data = UIImageJPEGRepresentation(image, 1.0);
    }
    
    if (!data) {
         [MBProgressHUD showMessage:@"您还没有签名哟~"];
       
    }
    else{
    [MBProgressHUD showMessage:@"签名保存中咯巴拉巴拉~"];
    
    // 几秒后消失,当然，这里可以改为网络请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            //保存
            [[NSFileManager defaultManager] createFileAtPath:self.imagePath contents:data attributes:nil];
            [self.drawView clear];
            
            // 提醒有没有新数据
            //[MBProgressHUD showMessage:@"OK啦"];
            //[self performSegueWithIdentifier:@"menu" sender:self];
            
        });
  
        
    }
}
- (IBAction)delete:(id)sender {
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"name"];
    
}
- (IBAction)post:(id)sender {
   
    //[_drawView addLA];
    
    
    
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = _drawView.aPath.CGPath;
    keyframeAnimation.repeatCount=1;
    keyframeAnimation.removedOnCompletion = NO;
    keyframeAnimation.fillMode = kCAFillModeForwards;
    keyframeAnimation.duration = 4.0f;
    keyframeAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyframeAnimation.delegate=self;
    [_drawView.layer addAnimation:keyframeAnimation forKey:nil];
    
    
    
    
}
@end
