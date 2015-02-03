//
//  RCRBaseObject.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 2/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRBaseObject.h"

@implementation RCRBaseObject

#pragma mark - Lifecycle

-(void) awakeFromInsert{
    
    [super awakeFromInsert];
    //Se llama una vez en la vida
    [self setupKVO];
}

-(void) awakeFromFetch{
    
    [super awakeFromFetch];
    //Se llama un cojonal de veces
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self tearDownKVO];
}

#pragma mark - Utils

-(NSArray *) observableKeys{
    
    return nil;
}

#pragma mark - KVO

-(void) setupKVO{
    //Alta en notificaciones para las propiedades que quiero observar
    for (NSString* key in [self observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
}

-(void) tearDownKVO{
    
    //Baja de todas las listas de Spam
    for (NSString *key in [self observableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
    }
}

@end
