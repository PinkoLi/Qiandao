//
//  ViewController.m
//  Qiandao
//
//  Created by PinkoLi on 16/4/5.
//  Copyright © 2016年 ck. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+YS.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _groups=[[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
//    _groups2=[[NSMutableArray alloc]init];
//    _groups3=[[NSArray alloc]init];
        NSLog(@"hahah");
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(id)sender {
    
    
        if (![_groups containsObject: _name.text]) {
            NSLog(@"meiyou");
              [MBProgressHUD showError:@"您输入的有误"];
            
        }
//         if ([user objectForKey:@"group"]==nil){
//        
//        //_groups2=[[NSMutableArray alloc]init];
//             
//            [_groups2 addObject:_name.text];
//             _groups3= [NSArray arrayWithArray:_groups2];
//        [user setObject:_groups3 forKey:@"group"];
//               NSLog(@"%@",[user objectForKey:@"group"]);
//            [user synchronize];
//             [user setObject:_name.text forKey:@"name"];
//             
//             [user synchronize];
//             [self performSegueWithIdentifier:@"menu" sender:self];
//             NSLog(@"%@",[user objectForKey:@"group"]);
//        
//        }
//   else  if([[user objectForKey:@"group"] containsObject: _name.text]){
//       
//        
//            NSString*str =[_name.text stringByAppendingString:@"-2"];
//            
//
//             [user setObject:str forKey:@"name"];
//             
//             [user synchronize];
//        [MBProgressHUD showSuccess:@"登录成功"];
//        [self performSegueWithIdentifier:@"menu" sender:self];
//        }
    
    
        
        else {
          
//            [_groups2 addObjectsFromArray:[user objectForKey:@"group"]];
//            [_groups2 addObject:_name.text];
//             NSLog(@"%@",_groups2);
//            _groups3= [NSArray arrayWithArray:_groups2];
//            NSLog(@"%@",_groups3);
//            [user setObject:_groups3 forKey:@"group"];
//            
//            NSLog(@"%@",[user objectForKey:@"group"]);
           
             NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:_name.text forKey:@"name"];
            
            [user synchronize];
            [MBProgressHUD showSuccess:@"登录成功"];
            
            
            [self performSegueWithIdentifier:@"menu" sender:self];
              NSLog(@"%@",[user objectForKey:@"name"]);
            
        }
    }
    
    
    



#pragma mark event handler
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
//- (NSArray*)groups {
//    if (!_groups) {
//       // _groups=[[NSArray alloc]initWithObjects:@"1", nil];
//        _groups=[[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
//    }
//    return _groups;
//}

@end
