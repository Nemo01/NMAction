//
//  NMActionView.h
//  ActivityDemo
//
//  Created by nemo on 16/3/23.
//  Copyright © 2016年 nemo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define GetActualSize(s) ([UIScreen mainScreen].bounds.size.width * (s)/(750.0))
#define ImageKey @"image"
#define TextKey @"text"

@interface NMActionView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView *mainCollectionView;
@property(nonatomic, strong) UIButton *cancelButton;
@property(nonatomic, strong) NSArray *dataArray;
@property(nonatomic, strong) NSArray *selectedArray;
@property(nonatomic, strong) UIView *bottomView;

-(void)loadData;
-(void)showActionView;

@end
