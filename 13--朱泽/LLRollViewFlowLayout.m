//
//  LLRollViewFlowLayout.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLRollViewFlowLayout.h"

@implementation LLRollViewFlowLayout

- (void)prepareLayout{
    CGFloat W = self.collectionView.bounds.size.width;
    CGFloat H = self.collectionView.bounds.size.height;
    self.itemSize = CGSizeMake(W,H);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
