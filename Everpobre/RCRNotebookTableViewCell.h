//
//  RCRNotebookTableViewCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCRNotebookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *notesView;

+(CGFloat)height;
+(NSString*)cellId;

@end
