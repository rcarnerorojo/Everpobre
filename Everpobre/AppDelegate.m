//
//  AppDelegate.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 2/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "RCRNote.h"
#import "RCRNotebook.h"

@interface AppDelegate ()
@property (nonatomic,strong)AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //Creamos el stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    //Creamos datos chorras
    [self createDummyData];
    [self trastearConDatos];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Utils

-(void) createDummyData{
    
    //para borrar todos los datos
    [self.stack zapAllData];
    
    RCRNotebook *nb = [RCRNotebook notebookWithName:@"Ex-novaias para el recuerdo" context:self.stack.context];
    
    [RCRNote noteWithName:@"Mariana Dávalos"
                 notebook:nb
                  context:self.stack.context];

    [RCRNote noteWithName:@"Camila Dávalos"
                 notebook:nb
                  context:self.stack.context];

    [RCRNote noteWithName:@"Pampita"
                 notebook:nb
                  context:self.stack.context];
    
    //Fisgoneamos
    //NSLog(@"Libreta: %@", nb);
    //NSLog(@"Exs: %@", nb.notes);
}

-(void) trastearConDatos{
    
    RCRNotebook *apps = [RCRNotebook notebookWithName:@"Ideas de Apps"
                                              context:self.stack.context];
    
    RCRNote *iCachete = [RCRNote noteWithName:@"iCachete"
                 notebook:apps
                  context:self.stack.context];
    //Comprobar que modificationDate se actualiza
    NSLog(@"Antes: %@", iCachete.modificationDate);

    iCachete.text = @"App educativa para reforzar la coordinación motora fina y los reflejos";
    
    NSLog(@"Después: %@", iCachete.modificationDate);
    
    //Búsqueda
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[RCRNote entityName]];
    r.fetchBatchSize = 20;
    //Criterios de ordenación, primero por nombre (si no añadimos el selector es sensible a mayúsculas, ordenaría en modo no humano) y luego por fecha (en caso de empate)
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RCRNoteAttributes.name
                                                        ascending:YES selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:RCRNoteAttributes.modificationDate
                                                        ascending:NO]];

    //si quisiéramos comparar con otras libretas tendré que guardarme referencias o usar su id
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@",apps];

    //Buscamos
    NSArray *res = [self.stack executeSearchWithRequest:r errorBlock:^(NSError *error) {
       NSLog(@"Error al buscar %@", error);
    }];
    
    NSLog(@"Número de libretas: %lu", (unsigned long) [res count]);
    //esto lo hacemos porque tenemos tres, no tiene sentido obligar a pedirlos todos
    NSLog(@"las libretas: %@", res);
    
    //¿de verdad es un array? No lo es porque entonces estaríamos guardando todos los datos en memoria
    //realmente va pidiendo los datos a medida que los necesitemos
    NSLog(@"Clase: %@", [res class]);
    
    //Borrar
    [self.stack.context deleteObject:apps]; //borro la libreta
    
    r.predicate = nil;
    res = [self.stack executeSearchWithRequest:r errorBlock:^(NSError *error) {
        NSLog(@"Error al buscar %@", error);
    }];
    
//    if (res == nil) {
//        NSLog(@"Error al buscar de nuevo: %@", res);
//    }

    NSLog(@"Notas existentes: %@", res);
    
    //Guardamos
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %@", error);
    }];
}













@end
