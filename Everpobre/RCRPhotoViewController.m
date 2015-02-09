//
//  RCRPhotoViewController.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRPhotoViewController.h"
#import "RCRNote.h"
#import "RCRPhotoContainer.h"
@import CoreImage;

@interface RCRPhotoViewController ()
    @property (strong, nonatomic) RCRNote* model;
@end

@implementation RCRPhotoViewController

-(id) initWithModel:(RCRNote*) model{
    
    if ([self initWithNibName:nil bundle:nil]){
        _model = model;
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //sincronizamos modelo -> vista
    self.photoView.image = self.model.photo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //sincronizamos vista -> modelo
    self.model.photo.image = self.photoView.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
    
    //Crear Picker
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    //Configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //tenemos camera
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        //nos conformamos con el carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //Presentar
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                           //bloque que se va a ejecutar cuando se termine de presentar la vista. Nos ahorrará responder a métodos de delegado 
                           NSLog(@"Terminé!!!");
                       }];
}

- (IBAction)deletePhoto:(id)sender {
    CGRect oldRect = self.photoView.bounds;
    //Animación
    [UIView animateWithDuration:0.8
                          delay:0
                        options:0
                     animations:^{
                        //Estado final (se va a animar)
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
                     } completion:^(BOOL finished) {
                         //Quitar la foto del modelo
                         self.model.photo.image = nil;
                         //Quitar la foto de la vista
                         self.photoView.image = nil;
                         //Dejamos la vista como estaba
                         self.photoView.bounds = oldRect;
                         self.photoView.alpha = 1;
                     }];
    //animación con muelle
    [UIView animateWithDuration:0.8
                          delay:0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.4
                        options:0
                     animations:^{
                         //transformada afín
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     } completion:^(BOOL finished) {
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
}

- (IBAction)vintagifyPhoto:(id)sender {
    
    //Creamos un contexto
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //Obtenemos la imagen original
    CIImage *original = [CIImage imageWithCGImage:self.photoView.image.CGImage];
    
    //Creamos y configuramos el filter
    CIFilter *falseColor = [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:original forKey:@"InputImage"];
    
    //Obtengo la imagen de salida
    CIImage *output = falseColor.outputImage;
    
    //Creamos el filtro de viñeta
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
    [vignette setDefaults];
    [vignette setValue:@8 forKey:@"InputIntensity"];
    
    //Los encadenamos
    [vignette setValue:output forKey:@"InputImage"];
    output = vignette.outputImage;
    
    //Aplicamos el filtro (puede ser bloqueante)
    CGImageRef final = [context createCGImage:output fromRect:[output extent]];
    
    //Obtengo la imagen en forma de UIImageView
    UIImage *finalImg = [UIImage imageWithCGImage:final];
    
    //Liberamos recursos
    CGImageRelease(final);
    
    //Insertamos la imagenen UIImageVie
    self.photoView.image = finalImg;
    //self.model.photo.image = finalImg; //ya lo hacemos en viewWillDisappear
}

#pragma mark - UIImagePickerControllerDelegate

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //OJO! Pico de memoria
    
    self.model.photo.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //Ocultar el picker. Quien muestra, oculta
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
