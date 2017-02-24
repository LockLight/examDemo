//
//  LLTopView.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLTopView.h"

@implementation LLTopView{
    NSMutableArray<UIButton *> *_btnList;
    //记录上一次被选中的按钮
    UIButton *_selectedBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setIdxPath:(NSInteger)idxPath{
    _idxPath = idxPath;
    
 
    //取消原先选中状态
    _selectedBtn.selected = NO;

    //设置当前按钮选中状态
    _selectedBtn = _btnList[idxPath];
    _selectedBtn.selected = YES;
    

}

- (void)setupUI {
    //创建3个索引按钮
    NSArray *titleArr = @[@"索引1",@"索引2",@"索引3"];
    
    _btnList = [NSMutableArray arrayWithCapacity:titleArr.count];
    
    NSInteger index = 0;
    
    for (NSString *title in titleArr) {
        UIButton *btn = [UIButton cz_textButton:title fontSize:16 normalColor:[UIColor blackColor] selectedColor:[UIColor redColor]];
        btn.tag = index++;
        
        [self addSubview:btn];
        [_btnList addObject:btn];
        
        [btn addTarget:self action:@selector(changeindexPath:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [_btnList mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [_btnList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
    }];
    
    //设置默认启动为第一个按钮
    _btnList[0].selected = YES;
    _selectedBtn.selected = _btnList[0];
}

- (void)changeindexPath:(UIButton *)sender{
    self.tag = sender.tag;
    //发送消息给接受者
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    //更新frame
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}













@end
