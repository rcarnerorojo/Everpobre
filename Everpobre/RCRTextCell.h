//
//  RCRTextCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCRTextCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *text;

+(NSString *) cellId;
+(CGFloat) cellHeight;

@end
