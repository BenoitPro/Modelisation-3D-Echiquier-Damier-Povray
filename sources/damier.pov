
// ------------------------- Les importations de package ------------------------- \\

#include "colors.inc" // package de couleur 
#include "textures.inc" // package de textures

// ------------------------- Texture chrome modifier pour les diables ------------ \\   
        
#declare Chrome_Texture2 = 
texture {
    pigment { rgb <1, 0, 0> }
    finish {
        ambient 0.3
        diffuse 0.7
        reflection 0.15
        brilliance 8
        specular 0.8
        roughness 0.1
    }
}    
        
// ------------------------- Création du Damier ------------------------- \\


#macro damier(nbcases,largeur,hauteur,typeDePion,textu1,textu2,positionCamera)
    
                // Création du Damier \\
    box  {
          <0,0,0>
          <nbcases , -0.5 , nbcases >          
          pigment {
                checker // le damier
                color <1,1,1> // case de couleur blanche
                color <0,0,0> // case de couleur noir          
          }          
    finish { reflection 0.3  // effet de reflection 
             specular 0.3  }
        }
   
             // Création du Contour du damier \\
    union {             
    
    box {  <-0.17,-0.5,-0.17> , <nbcases+0.17 , 0 ,0>  }    
    box { <nbcases,-0.5,0> , <nbcases+0.17 , 0 ,nbcases+0.17> }    
    box { <-0.17,-0.5,nbcases> , <nbcases+0.17 , 0 ,nbcases+0.17> }    
    box { <-0.17,-0.5,0> , <0 , 0 ,nbcases+0.17> }
    
    cylinder {<-0.1 , -0.25 , -0.1>, <nbcases+0.1 , -0.25 , -0.1>, 0.275}    
    cylinder {<nbcases+0.1 , -0.25 , -0.1>  ,<nbcases+0.1 , -0.25 , nbcases+0.1> ,  0.275 }    
    cylinder {  <nbcases+0.1 , -0.25 , nbcases+0.1>, <-0.1 , -0.25 , nbcases+0.1>,  0.275 }
    cylinder { <-0.1 , -0.25 , nbcases+0.1> ,  <-0.1 , -0.25 , -0.1>, 0.275 }
    
    sphere { <-0.1 , -0.25 , -0.1> ,   0.275}
    sphere { <nbcases+0.1 , -0.25 , -0.1> ,  0.275}
    sphere {  <nbcases+0.1 , -0.25 , nbcases+0.1> ,  0.275 }   
    sphere { <-0.1 , -0.25 , nbcases+0.1> 0.275 }         
     
    pigment {color <0.5,0.5,0.5> }
    finish { reflection 0.1
             specular 1  }
             
    }
        
              // Positionnenment des Pions \\
        positionPion(nbcases,largeur,hauteur,typeDePion,textu1,textu2) 
        
             // Placement de la camera \\ 
        placeCamera(nbcases,positionCamera) 
        
#end    


// ----------------------- Positionnenement des Pions ---------------------- \\

#macro positionPion(nbcases,largeur,hauteur,typeDePion,textu1,textu2)  
        
        
        //-- Calcul du nb de lignes de pions d'un joueur en fonction de la parité du nombre de cases --\\
        
        #if (mod(nbcases,2) = 1 ) #declare nblignes = floor(nbcases/2) ; 
        #else #declare nblignes = (nbcases/2)-1 ; 
        #end
        
        
        #declare joueur=0;
        #declare j=0;
        #declare tmp=nblignes+1;   // grâce à la variable tmp la fonction peut etre lancé 1 seule fois et placé tous les pions
        #while (joueur<2)
                
                #if (joueur=0) #declare i=0;
                #else  // pour le 2ieme joueur la 1iere ligne de pion commence à "tmp"
                        #if (mod(nbcases,2)=1) #declare tmp =nblignes+1;         // nbcases impaire
                        #else #declare tmp=nblignes+2;                           // nbcases pair
                        #end 
                        
                        #declare i = tmp ;
                #end       
                
                        #while(i!=nblignes & i<(tmp+nblignes) ) // cette boucle s'execute 2 fois : pour le 1ier joueur et pour le 2ieme
                        
                                #declare j=0;                
                                #while(j<nbcases)
                                        #if(mod(i,2) = 0) 
                                                #if (mod(j,2) = 0) pion(largeur,hauteur,< j+0.5 , 0 , i+0.5 > ,typeDePion,joueur,textu1,textu2)
                                                #end
                                        #else 
                                                #if (mod(j,2) = 1) pion(largeur,hauteur,< j+0.5 , 0 , i+0.5 > ,typeDePion,joueur,textu1,textu2)   
                                                #end
                                        #end          
                                    #declare j=j+1;
                                #end
                             #declare i=i+1;   
                        #end
                        
                        
             #declare joueur = joueur+1 ;
        
        #end   


#end        


// ------------ le Pion ------------- \\


#macro pion (largeur,hauteur, position , typeDePion , joueur , textu1 , textu2 ) // le pion prend 7 parametres ( sa largeur , sa hauteur , sa position, 
                                                                         // , le typeDepion, le numéro du joueur, la texture joueur 1 la texture joueur 2)
   
 
        //-- Vérification des parametre hauteur et largueur --\\
        #if (largeur > 1) #declare largeur=1; #end
        #if (hauteur > 1) #declare hauteur=1; #end
 
 
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
                          #if (textu2 = 1)
                                texture {  Cherry_Wood
                                          finish {
                                           specular 1
                                           reflection 0.1 }
                                         } 
                         #else
                                #if (textu2 = 2)
                                        texture {       Chrome_Texture2
                                                scale 0.5
                                                finish {
                                                   specular 0.8
                                                   reflection 0.4 }
                                                 } 
                                                 
                                 #else 
                                        #if (textu2 = 3)
                                                texture { Glass3      
                                                        finish {
                                                           specular 1
                                                           reflection 0.5 }
                                                           scale 0.3
                                                         }  
                                         #end
                                #end 
                          #end  
                   #else  // Si c'est le joueur 0
                         #if (textu1 = 1)                 
                         texture { Chrome_Texture
                                    finish {
                                   specular 0.9
                                   reflection 0.2 }
                                 }  
                                 
                                 
                         #else
                                 #if (textu1 = 2) 
                                        texture { Blue_Agate
                                             finish {
                                           specular 1
                                           reflection 0.3 }
                                         }  
                                #else 
                                         #if (textu1 = 3)
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
                
                scale <largeur,hauteur,largeur> // mise a l'echelle en fonction des parametre hauteur et largeur         
                translate position  // Positionnement du Pion en fonction du parametre position  
        }
#end 


// --------------------- Placement de la camera ----------------------------- \\


#macro placeCamera(nbcases,positionCamera) 

             //-- Configuration des variables selon la vu désiré --\\
             
        #if (positionCamera = 0)    // vu joueur0 , derriere les pions du joueur 0                         
            #declare cx = nbcases * (3/4);
            #declare cy = nbcases/1.2 ;
            #declare cz = nbcases *3/2;
            
            #declare lx = nbcases / 2 ;
            #declare lz =  nbcases/1.5 ;            
            
            
        #else
                 #if (positionCamera = 1)    // vu joueur1 , derriere les pions du joueur 1                         
                    #declare cx = nbcases * (3/4);
                    #declare cy = nbcases/1.2 ;
                    #declare cz = -nbcases * (1/2);
                   
                    #declare lx = nbcases / 2 ;
                    #declare lz =  nbcases/3 ;                    
                    
            
                 #else                    // vu spectateur, sur le coté du damier
                            #declare cx = -nbcases * (1/2);
                            #declare cy = nbcases/1.2 ;
                            #declare cz = nbcases / 1.5 ;
                            
                            #declare lx = nbcases / 2.3 ;
                            #declare lz =  nbcases/2 ;  
                 #end          
        #end
        
                //-- Définie la caméra selon les variables cx,cy,cz, lx,lz --\\
           camera {
                   location < cx ,cy ,cz >    
                   look_at < lx, 0 , lz >
                  }
           
                //-- Définition des lumieres (également de manière dynamique) --\\
           light_source {
                < cx , cy , cz  >
                color <1,1,1> 
                spotlight   
                tightness 10 
                point_at < nbcases/2 , 0 , nbcases/2 >  
            }
           light_source {
                < 0 , nbcases , 0 >
                color <1,1,1>
            
            }
            
           light_source {
                < 0 , nbcases*20 , 0 >
                color <0.7,0.7,0.7>
            
            }
#end


// Voici l'appel de la macro qui crée notre damier personnalisé 
// les parametres sont : nb de cases , largeur du pion , hauteur du pion , typeDePion (1 ou 2), texture joueur0 (de 1 à 3) , texture joueur1 (de 1 à 3), positionnement de la camera(de 0 à 2))


 // damier(6,0.8,0.8,1,2,1,1) // damier normal
//damier(6,0.4,0.8,1,2,2,1) // damier avec pions étiré
//damier(5,0.4,0.4,1,3,2,1) // damier avec petites  pièces
//damier(20,0.8,0.8,1,1,2,1) // damier avec beaucoup de pions
damier(6,0.8,0.8,2,1,2,0)    // damier normal avec le theme ange / démon

plane {
        y,-3
        pigment {color White }
        }
        

     