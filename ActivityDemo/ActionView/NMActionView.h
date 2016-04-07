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

@protocol ActionViewDelegate <NSObject>
-(void)customCellSelected:(NSInteger)index;
@end

@interface NMActionView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView *mainCollectionView;
@property(nonatomic, strong) UIButton *cancelButton;
@property(nonatomic, strong) NSArray *dataArray;
@property(nonatomic, strong) NSArray *selectedArray;
@property(nonatomic, strong) UIView *bottomView;
@property(nonatomic, weak) id <ActionViewDelegate> actionDelegate;

-(void)loadData;
-(void)showActionView;

@end
