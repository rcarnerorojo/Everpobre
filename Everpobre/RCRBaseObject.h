//
//  RCRBaseObject.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 2/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import CoreData;

@interface RCRBaseObject : NSManagedObject

-(NSArray *) observableKeys;
-(void) setupKVO;
-(void) tearDownKVO;

@end
