//
//  RCRPhotoTableViewCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
@class RCRNote;

@interface RCRPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

+(CGFloat)height;
+(NSString*)cellId;

@property (nonatomic, strong) RCRNote *note;

@end
