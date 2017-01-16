#macro reine(position,couleur)

union {
           torus {
                        1
                        0.1
                       }
                       
           torus {      1.1
                        0.2
                       translate 0.3*y
                 }
                 
             cylinder {
                        <0,0,0>
                        <0,0.3,0>
                        1
                        translate 0.4*y
                        }
                        
                        
                
             cone {
                <0,0,0>
                0.6
                <0,2.5,0>
                0.2
                translate 0.7*y
             
             } 
             cone {
                <0,0,0>
                0.2
                <0,0.2,0>
                0.6
                translate 3.2*y
             
             } 
                
             torus {
                0.6
                0.05
                translate 3.4*y
             }
             
                
             torus {
                0.5
                0.1
                translate 3.5*y
             }  
             torus {
                0.4
                0.05
                translate 3.6*y
             }
             difference {
                     sphere {
                        <0,0,0>
                        0.7
                        scale 1.5*y
                        translate 4.3*y
                     }
                     sphere {
                        <0,0,0>
                        0.6
                        scale 1.5*y
                        translate 4.3*y
                     }
                                  
                      box {
                        <0,0,0>
                        <2,2,2>
                        translate <-1,4.6,-1>
                     }
             
                      box {
                        <0,0,0>
                        <2,2,2>
                        translate <-1,1.5,-1>
                     }
                          
                          
              }
              union{
                      cone { 
                        <0,0,0>
                        0.06
                        <0,0.6,0>
                        0
                      }     
                       
                       
                       sphere {
                                <0,0,0>
                                0.1
                                translate 0.6*y
                       }                      
                       
                        translate <-0.6,4.5,0>
              }
              
              union{
                      cone { 
                        <0,0,0>
                        0.06
                        <0,0.6,0>
                        0
                      }     
                       
                       
                       sphere {
                                <0,0,0>
                                0.1
                                translate 0.6*y
                       }                      
                       
                        translate <0.6,4.5,0>
              }
              
              union{
                            cone { 
                <0,0,0>
                0.06
                <0,0.6,0>
                0
              }     
               
               
               sphere {
                        <0,0,0>
                        0.1
                        translate 0.6*y
               }                      
               
                translate <-0.3,4.5,0.3>
              }
                union{
                            cone { 
                <0,0,0>
                0.06
                <0,0.6,0>
                0
              }     
               
               
               sphere {
                        <0,0,0>
                        0.1
                        translate 0.6*y
               }                      
               
                translate <0.3,4.5,0.5>
              }
              
              union{
                            cone { 
                <0,0,0>
                0.06
                <0,0.6,0>
                0
              }     
               
               
               sphere {
                        <0,0,0>
                        0.1
                        translate 0.6*y
               }                      
               
                translate <-0.3,4.5,-0.55>
              }
                union{
                            cone { 
                <0,0,0>
                0.06
                <0,0.6,0>
                0
              }     
               
               
               sphere {
                        <0,0,0>
                        0.1
                        translate 0.6*y
               }                      
               
                translate <0.3,4.5,-0.5>
              }
              
                         
                         
             
             
                
        pigment { color couleur}
        finish {
                reflection 0.3
                specular 0.5
        }
        
        scale 0.3
        translate position
        
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

reine(<0,0,0>,<1,1,1>)     

*/             