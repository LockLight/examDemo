//
//  LLTwoViewController.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLTwoViewController.h"
#import "LLTopView.h"
#import "LLRollViewFlowLayout.h"


static NSString* ImgCell = @"ImgCell";

@interface LLTwoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) LLTopView *topView;
@property (nonatomic, weak) UICollectionView *rollView;



@end

@implementation LLTwoViewController{
    NSArray *_imgArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

//当前滚动偏移量
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger idxPath = scrollView.contentOffset.x /scrollView.bounds.size.width;
    _topView.idxPath = idxPath;
}

- (void)changePage:(LLTopView *)sender{
    [_rollView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}


- (void)setupUI{
    //创建头部索引视图
    LLTopView *topView = [[LLTopView alloc]init];
    [self.view addSubview:topView];

    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(100);
    }];
    
    [topView addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    _topView = topView;
    
    //初始化图片数组
    _imgArr = @[@"image01",@"image02",@"image03"];
    
    //图片滚动视图
    LLRollViewFlowLayout *flowLayout = [[LLRollViewFlowLayout alloc]init];
    UICollectionView *rollView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    rollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:rollView];
    
    [rollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom);
        make.right.left.bottom.equalTo(self.view);
    }];
    
    _rollView = rollView;
    //分页
    rollView.pagingEnabled = YES;
    
    rollView.dataSource = self;
    rollView.delegate = self;
    
    //注册
    [rollView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ImgCell];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imgArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImgCell forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imgArr objectAtIndex:indexPath.row]]];
    return cell;
}

@end
