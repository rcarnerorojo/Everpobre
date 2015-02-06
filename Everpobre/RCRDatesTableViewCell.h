//
//  RCRDatesTableViewCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCRNote;

@interface RCRDatesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *creationDate;
@property (weak, nonatomic) IBOutlet UILabel *modificationDate;

@property (nonatomic, strong) RCRNote *note;

+(CGFloat)height;
+(NSString*)cellId;

@end
