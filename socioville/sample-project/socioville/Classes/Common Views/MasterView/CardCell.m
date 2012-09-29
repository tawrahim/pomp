//
//  CardCellCell.m
//  socioville
//
//  Created by Tope on 17/04/2012.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import "CardCell.h"
#import "AppDelegate.h"

@implementation CardCell

@synthesize playImageView, commentButton, likeButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    UIImage* commentBg = [[AppDelegate instance].colorSwitcher getImageWithName:@"fb_comment.png"];
    [commentButton setImage:commentBg forState:UIControlStateNormal];
    
    UIImage* likeBG = [[AppDelegate instance].colorSwitcher getImageWithName:@"fb_like.png"];
    [likeButton setImage:likeBG forState:UIControlStateNormal];
    
    [playImageView setImage:[[AppDelegate instance].colorSwitcher getImageWithName:@"play-big.png"]];
    // Configure the view for the selected state
}

@end
