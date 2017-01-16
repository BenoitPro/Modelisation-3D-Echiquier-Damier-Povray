#macro cavalier(position,couleur,rot)
union {
   torus {
                1
                0.1
               }
               
   torus {
                1.1
                0.2
               translate 0.3*y
         }
         
     cylinder {
                <0,0,0>
                <0,0.3,0>
                1
                translate 0.4*y
                }
                
      sphere {
                <0,0,0>
                0.5
                scale 3.5*x
                rotate -80*z
                translate <-0.1,1.5,0>
      
      }    
      difference {
              sphere {
                        <0,0,0>
                        0.3
                        scale 2.8*x
                        rotate -10*z
                        translate <0.3,2.9,0> 
                                       
              
              }   
             
       sphere {
                        <0,3.3,-0.1>
                        0.1
              
              }
       sphere {
                        <0,3.3,0.1>
                        0.1
              
              }
              
      }
               
      
                                    
      cone {
                <0,0,0>
                0.1
                <0,0.6,0>
                0
                translate <-0.4,3,0.1>      
      }
                
      cone {
                <0,0,0>
                0.1
                <0,0.6,0>
                0
                translate <-0.4,3,-0.1>      
      }
                
                      
        pigment { color couleur}
        finish {
                reflection 0.3
                specular 0.5
        }
        
        scale 0.3
        rotate rot
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

cavalier(<0,0,0>,<1,1,1>,90*y)   
*/