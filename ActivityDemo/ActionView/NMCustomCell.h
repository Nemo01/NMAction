//
//  NMCustomCell.h
//  ActivityDemo
//
//  Created by nemo on 16/3/23.
//  Copyright © 2016年 nemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMCustomCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *nameLabel;

+ (NSString *)cellReuseId;

//- (void)customSubviews;
- (void)updateCellWithData:(id)data;

@end
