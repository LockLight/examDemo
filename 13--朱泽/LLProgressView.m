//
//  LLProgressView.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLProgressView.h"

@implementation LLProgressView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    //圆心
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height /2);
    //半径
    CGFloat radius = 80;
    //起始点和结束点
    CGFloat start = - M_PI_2;
    CGFloat end = self.progressValue * 2 * M_PI - M_PI_2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    
    [path addLineToPoint:center];
    
    
    [[UIColor redColor] set];
    [path fill];
    
    
    //半径
    CGFloat inradius = 35;
 
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:inradius startAngle:start endAngle:end clockwise:YES];
    
    [path1 addLineToPoint:center];
    
    
    [[UIColor yellowColor] set];
    [path1 fill];
    
    
    
}


@end
