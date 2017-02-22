//
//  MyView.h
//  DrawWall
//
//  Created by gll on 13-1-2.
//  Copyright (c) 2013年 gll. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MyView : UIView
// get point  in view
-(void)addPA:(CGPoint)nPoint;
-(void)addLA;
-(void)revocation;
-(void)refrom;
-(void)clear;
-(void)setLineColor:(NSInteger)color;
-(void)setlineWidth:(NSInteger)width;
@property(nonatomic, strong) UIBezierPath *bezier;
//存储Undo出来的线条
@property(nonatomic, strong) NSMutableArray *cancleArray;

@property(nonatomic, strong) UIBezierPath*aPath;
@end
