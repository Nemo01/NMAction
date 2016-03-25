//
//  NMActionView.m
//  ActivityDemo
//
//  Created by nemo on 16/3/23.
//  Copyright © 2016年 nemo. All rights reserved.
//

#import "CustomCell.h"
#import "NMActionView.h"


@implementation NMActionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    return self;
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews{
    [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self setBackgroundColor:[UIColor colorWithRed:214.0/255 green:214.0/255 blue:214.0/255 alpha:0.8]];
    
    _bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-GetActualSize(302.0), ScreenWidth, GetActualSize(302.0))];
    [_bottomView setBackgroundColor:[UIColor lightGrayColor]];
    
    [self addSubview:_bottomView];
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _mainCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, GetActualSize(224.0)) collectionViewLayout:flowLayout];
    _mainCollectionView.delegate=self;
    _mainCollectionView.dataSource=self;
    _mainCollectionView.pagingEnabled=NO;
    [_mainCollectionView setBackgroundColor:[UIColor clearColor]];
    [_bottomView addSubview:_mainCollectionView];
    
    //注册Cell，必须要有
    [_mainCollectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:[CustomCell cellReuseId]];
    
    _cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, GetActualSize(224.0), ScreenWidth, GetActualSize(88.0))];
    [_cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancelButton setBackgroundColor:[UIColor whiteColor]];
    [_cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:_cancelButton];
    
}


#pragma mark - collectionview datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dataArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell=nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CustomCell cellReuseId] forIndexPath:indexPath];
//    [cell updateCellWithData:_dataArray];
    UIImage *image=[UIImage imageNamed:[[_dataArray objectAtIndex:indexPath.row] objectForKey:ImageKey]];
    [cell.imageView setImage:image];
    [cell.nameLabel setText:[[_dataArray objectAtIndex:indexPath.row] objectForKey:TextKey]];
    
//    UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];
//    selectedBGView.backgroundColor = [UIColor redColor];
//    cell.selectedBackgroundView = selectedBGView;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didselect");
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// cell点击变色
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor purpleColor]];
    CustomCell* cell = (CustomCell*)[collectionView cellForItemAtIndexPath:indexPath];
    UIImage *image=[UIImage imageNamed:[_selectedArray objectAtIndex:indexPath.row]];
    [cell.imageView setImage:image];
}

// cell松开变色
- (void)collectionView:(UICollectionView *)collectionView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell* cell = (CustomCell*)[collectionView cellForItemAtIndexPath:indexPath];
    UIImage *image=[UIImage imageNamed:[[_dataArray objectAtIndex:indexPath.row] objectForKey:ImageKey]];
    [cell.imageView setImage:image];
    

}

#pragma mark -UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat offset = GetActualSize(100.0);
    CGFloat offseth = GetActualSize(140.0);
    return CGSizeMake(offset, offseth);

}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    CGFloat offset = GetActualSize(40.0);
    return UIEdgeInsetsMake(offset, offset, offset, offset);
    
}

#pragma mark - action method
-(void)cancelAction:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        _bottomView.center=CGPointMake(CGRectGetMidX(_bottomView.bounds), ScreenHeight+CGRectGetHeight(_bottomView.bounds)/2);
    } completion:^(BOOL finished) {
        self.hidden=YES;
    }];
}

-(void)showActionView{
    [UIView animateWithDuration:0.5 animations:^{
        self.hidden=NO;
        _bottomView.center=CGPointMake(CGRectGetMidX(_bottomView.bounds),ScreenHeight-CGRectGetHeight(_bottomView.bounds)/2);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - load data method
-(void)loadData{
    [_mainCollectionView reloadData];
}

@end
