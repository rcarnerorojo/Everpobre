//
//  RCRPhotoCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCRPhotoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photo;

+(NSString *) cellId;
+(CGFloat) cellHeight;

@end
