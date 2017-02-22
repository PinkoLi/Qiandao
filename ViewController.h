//
//  ViewController.h
//  Qiandao
//
//  Created by PinkoLi on 16/4/5.
//  Copyright © 2016年 ck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
- (IBAction)go:(id)sender;
@property (nonatomic, strong) NSArray *groups;
//@property (nonatomic, strong) NSMutableArray *groups2;
//@property (nonatomic, strong) NSArray *groups3;
@end

