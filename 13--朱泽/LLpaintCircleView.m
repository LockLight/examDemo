//
//  LLpaintCircleView.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLpaintCircleView.h"
#define MAX_OFFSET 100

@implementation LLpaintCircleView{
    CGFloat _scale;
}

- (void)setOffset:(CGFloat)offset{
    _offset = offset;
    
    if(_offset < -MAX_OFFSET){
        _offset = -MAX_OFFSET;
    }
    _scale = _offset / MAX_OFFSET;
    
    [self setNeedsDisplay];
}


// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height /2);
    CGFloat radius = 35;
    CGFloat start = M_PI_2;
    CGFloat end =  - 2 * M_PI * _scale + M_PI_2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    
    path.lineWidth = 3;
    [[UIColor redColor]set];
    
    if(_offset == -MAX_OFFSET){
        [path moveToPoint:CGPointMake(center.x - 22, center.y+3)];
        [path addLineToPoint:CGPointMake(center.x - 7, center.y +14)];
        [path addLineToPoint:CGPointMake(center.x + 18, center.y -18)];
    }
    
    [path stroke];
}










@end
