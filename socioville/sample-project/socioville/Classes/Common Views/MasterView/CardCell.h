//
//  CardCellCell.h
//  socioville
//
//  Created by Tope on 17/04/2012.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView* playImageView;

@property (nonatomic, weak) IBOutlet UIButton* commentButton;

@property (nonatomic, weak) IBOutlet UIButton* likeButton;

@end
