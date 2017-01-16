// ------------ le Pion ------------- \\


#include "textures.inc" // on importe le package de Textures


#macro pion (largeur,hauteur, position , typeDePion , joueur , textu1 , textu2 ) // le pion prend 7 parametres ( sa largeur , sa hauteur , sa position, 
                                                                         // , le typeDepion, le numéro du joueur, la texture joueur 1 la texture joueur 2)
   
 
   //--- Modélisation du pion ---\\ 
 
        #if (typeDePion = 1)  // Pion simple
                   union {      sphere {  <0,1.7,0> , 0.4  }                                
                                cone {  <0,0,0> ,  0.5 , <0,1.5,0> , 0  }
         #end
                
       
         #if (typeDePion = 2)  // Ange VS Diable
                                                                                        
                             #if (joueur = 1)  // Si c'est un pion du joueur 1 on met un Diable
                                   
                                  union {                                   
                                                                     
                                        cone { <0,0,0>, 0.05, <0,0.5,0>, 0 // Corne du diable
                                         rotate 20*z              
                                         translate <-0.15,2,0>
                                             }
                                     
                                        cone { <0,0,0>, 0.05, <0,0.5,0>, 0 // Corne du diable
                                         rotate -20*z              
                                         translate <0.15,2,0>
                                             }
                                        sphere { <0,1.7,0>, 0.4 }  // tete
                                        
                                        cone { <0,0,0>, 0.5, <0,1.5,0>, 0 }
                                               
                      
                              #else       // Si c'est un pion du joueur 0 on met un Ange
                              
                                      union {   
                                        torus { 0.4, 0.03     // Oréole de l'ange                     
                                                rotate -20*x
                                                translate <0,2.2,-0.1>
                                              }
                                        
                                        sphere { <0,1.7,0>, 0.4 }
                                        
                                        cone { <0,0,0>, 0.5, <0,1.5,0>, 0 }
                              #end
                      
                      
           #end       
                        
                  
      //-- Gestion des textures  (parametres "textu1" et "textu2") --\\
        
                  #if (joueur = 1) // Si c'est le joueur 1    
                          #if (textu1 = 1)
                                texture {  Cherry_Wood
                                          finish {
                                           specular 1
                                           reflection 0.1 }
                                         } 
                         #else
                                #if (textu1 = 2)
                                        texture {  Chrome_Texture
                                                scale 0.5
                                                finish {
                                                   specular 0.8
                                                   reflection 0.4 }
                                                 } 
                                                 
                                 #else 
                                        #if (textu1 = 3)
                                                texture { Chrome_Texture2         
                                                        finish {
                                                           specular 1
                                                           reflection 0.5 }
                                                           scale 1
                                                         }  
                                         #end
                                #end 
                          #end  
                   #else  // Si c'est le joueur 0
                         #if (textu2 = 1)                 
                         texture { White_Marble
                                    finish {
                                   specular 0.9
                                   reflection 0.2 }
                                 }  
                                 
                                 
                         #else
                                 #if (textu2 = 2) 
                                        texture { Blue_Agate
                                             finish {
                                           specular 1
                                           reflection 0.3 }
                                         }  
                                #else 
                                         #if (textu2 = 3)
                                                texture { Lightning2              
                                                        finish {
                                                           specular 1
                                                           reflection 0.5 }                                                   
                                                         } 
                                         #end                 
                                 #end                             
                                                        
                        
                          #end 
                     #end  // fin de la gestion des TEXTURES                  
 
                 //-- Transformation du Pion (par rapport a sa Largeur et sa Hauteur)  --\\   
                 rotate 90*y
                 scale <largeur,hauteur,largeur> // mise a l'echelle en fonction des parametre hauteur et largeur         
                translate position  // Positionnement du Pion en fonction du parametre position  
        }
#end 

   /* 
camera {
        location <-1,2,-2>
        look_at <0,0.5,0> 


}                      
                      
        
light_source {

        <-2,500,0.5>
       color <1,1,1>
       }
light_source {

        <-5,6,-1>
       color <1,1,1>
       spotlight
       radius 1
       tightness 50
       
       point_at <0,2,0>
       }
light_source {

        <-2,3,-3>
       color <1,1,1>
       spotlight
       radius 1
       tightness 50
       
       point_at <0,2,0>
       }
       
plane {
        y,0
        pigment { color <1,1,1> }
        finish { 
        reflection 0.6
        }
}       

pion(0.5,0.5,<0,0,0>,1,2,3,2) 


*/    