//
//  RCRTextTableViewCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
@class RCRNote;

@interface RCRTextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) RCRNote *note;

+(CGFloat)height;
+(NSString*)cellId;

@end
