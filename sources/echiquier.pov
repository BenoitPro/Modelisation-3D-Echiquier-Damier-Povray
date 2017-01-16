//-------- Importation des package -----------\\
#include "tour.pov"
#include "cavalier.pov"
#include "fou.pov"
#include "roi.pov"
#include "reine.pov"
#include "pions.pov"


#include "colors.inc"
#include "textures.inc"


//----------- Création de l'échiquier (gràce a l'appel des différents fichiers importé) ------\\ 
#macro echiquier() 
    
    
                 // Création du Damier \\
    box  {
          <0,0,0>
          <8 , -0.5 , 8 >          
          pigment {
                checker 
                color <1,1,1>
                color <0,0,0>           
          }          
    finish { reflection 0.3
             specular 0.3  }
        }
        
        
        
             // Création du Contour du damier \\
    union {             
    
    box {  <-0.17,-0.5,-0.17> , <8+0.17 , 0 ,0>  }    
    box { <8,-0.5,0> , <8+0.17 , 0 ,8+0.17> }    
    box { <-0.17,-0.5,8> , <8+0.17 , 0 ,8+0.17> }    
    box { <-0.17,-0.5,0> , <0 , 0 ,8+0.17> }
    
    cylinder {<-0.1 , -0.25 , -0.1>, <8+0.1 , -0.25 , -0.1>, 0.275}    
    cylinder {<8+0.1 , -0.25 , -0.1>  ,<8+0.1 , -0.25 , 8+0.1> ,  0.275 }    
    cylinder {  <8+0.1 , -0.25 , 8+0.1>, <-0.1 , -0.25 , 8+0.1>,  0.275 }
    cylinder { <-0.1 , -0.25 , 8+0.1> ,  <-0.1 , -0.25 , -0.1>, 0.275 }
    
    sphere { <-0.1 , -0.25 , -0.1> ,   0.275}
    sphere { <8+0.1 , -0.25 , -0.1> ,  0.275}
    sphere {  <8+0.1 , -0.25 , 8+0.1> ,  0.275 }   
    sphere { <-0.1 , -0.25 , 8+0.1> 0.275 }         
    
    pigment {color <0.5,0.5,0.5> }
    finish { reflection 0.1
             specular 1  }
             
    }     
        
   // Appel des macros pour créé les pièce de l'échiquier \\
        // Toutes les macros prennent au moin 2 paramètres :
        //                      - la position
        //                      - la couleur
        // Certaine prennent en plus leur orientation (cavalier et fou)
   tour(<0.5,0,0.5>,Black) 
   tour(<7.5,0,0.5>,Black)              
   tour(<0.5,0,7.5>,White) 
   tour(<7.5,0,7.5>,White)
   
   cavalier(<1.5,0,0.5>,Black,-90*y) 
   cavalier(<6.5,0,0.5>,Black,-90*y)
   cavalier(<1.5,0,7.5>,White,90*y)
   cavalier(<6.5,0,7.5>,White,90*y)
   
   fou(<2.5,0,0.5>,Black,-90*y)
   fou(<5.5,0,0.5>,Black,-90*y)
   fou(<2.5,0,7.5>,White,90*y)
   fou(<5.5,0,7.5>,White,90*y)
   
   roi(<3.5,0,0.5>,Black)
   roi(<4.5,0,7.5>,White)
   
   reine(<4.5,0,0.5>,Black)
   reine(<3.5,0,7.5>,White)
   
   posePions()
#end

#macro posePions()
        #declare i=0;
        
        #while (i<8)
        
            pions(<i+0.5,0,1.5>,Black)
            pions(<i+0.5,0,6.5>,White)
            
            #declare i=i+1 ;
        #end

#end



camera { location <12,7,-2> 
look_at <5,0,3>  }

  
         
light_source {
        <-1,10,0>
        color < 0.5,0.5,0.5 >
        }
         
light_source {
        <-1,100,0>
        color < 1,1,1 >
        }
        
light_source {
        <-3.5,20.1,-5>
        color < 1,1,1 >
        spotlight
        tightness 10
        radius 1
        point_at <4,0,4>
        }

echiquier()

        
plane {
        y,-3
        pigment { color <1,1,1> }
        finish { reflection 1 
         specular 0.3 }
        }
        
        
//camera { location <4,3,-5.5> //bas
//  look_at <4,0,1>  }
 
 //camera { location <1,3,-6> // face
//look_at <0,1,0>  }
  
 
//camera { location <1,10,-3> // haut
// look_at <0,0.4,0>  }
  
  
 camera { location <-3,3,-3> // profil gauche
  look_at <2,1,2>  }
  
// camera { location <8,8,0> // profil droit
 // look_at <0,1,0>  }
  
// camera { location <6,10,-2> // profil droit
//  look_at <0,1,0>  }
  
        
