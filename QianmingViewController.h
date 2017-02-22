//
//  QianmingViewController.h
//  Qiandao
//
//  Created by PinkoLi on 16/4/5.
//  Copyright © 2016年 ck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QianmingViewController : UIViewController
- (IBAction)go:(id)sender;
@property (retain, nonatomic) NSString * imagePath;//存放图片路径
@property (nonatomic, strong) NSArray *groups;
- (IBAction)delete:(id)sender;
- (IBAction)post:(id)sender;
@end
