#include "textures.inc"

#macro  cornee(R,trans,rot)

              #declare i = R ;
              #declare p = 0 ;
              
              #while ( i>0 )
                          
                          torus {
                                i/5  // Rayon
                                0.01  // rayon du petit cercle
                                 texture { Chrome_Texture}    
                                translate <0,p,0>  
                              
                                rotate ((p*20)-45)*z  
                                
                                  translate trans
                                rotate rot
                                         
                          }
                        
              
                  #declare p = p+0.001 ;
                  #declare i = i-0.0009 ;    
              #end 
              

         



#end     



#macro  corne(R,trans,rot)

              #declare i = R ;
              #declare p = 0 ;
              
              #while ( i>0 )
                          
                          torus {
                                i/5  // Rayon
                                0.01  // rayon du petit cercle
                                texture { Chrome_Texture}    
                                translate <0,p,0>  
                              
                                rotate ((p*20)-45)*z  
                                
                                  translate trans
                                rotate rot
                                         
                          }
                        
              
                  #declare p = p+0.1 ;
                  #declare i = i-0.1 ;    
              #end 
              

         



#end     


 /*
plane {
        y,0
        pigment { color <1,1,1> }     


}
             
camera {
        location < 3 , 10 , -5>
        look_at < 0 ,0, 0>
        }       

camera {
        location < 3 , 10 , -10>
        look_at < 0 ,2, 0>
        }       
     
light_source {
        <3 , 10 , -5>
        color <1,1,1>
}    
light_source {
        <0 , 5 , 2>
        color <1,1,1>
}      

          
//corne(1,<0,2,0>,180*y )

corne(1,<0,5,0>,0)      

//corne2(4,<0,10,0>,0)

*/