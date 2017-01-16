#macro fou(position,couleur,rot)

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
                0.5
                <0,1.5,0>
                0.2
                translate 0.7*y
             
             } 
             
             cone {
                <0,0,0>
                0.2
                <0,0.2,0>
                0.4
                translate 2.2*y
             
             } 
              
               
             torus {
                        0.4
                        0.05
                        translate 2.4*y
             }
               
             torus {
                        0.3
                        0.05
                        translate 2.5*y
             }
             cylinder {
                        <0,0,0>
                        <0,0.1,0>
                        0.3
                        translate 2.5*y
             }
             difference {   
                     sphere {
                                <0,0,0>
                                0.4 
                                scale 1.2*y
                                translate 3*y
                     }     
                     
                     box {
                                <0,0,0>
                                <0.1,1,1>
                                rotate -33*z
                                translate <0.1,3.1,-0.5>
                     
                     }
             }                  
             
             
             sphere {
                        <0,0,0>
                        0.1
                        translate 3.55*y
             }
             
                
                
                
        pigment { color couleur}
        finish {
                reflection 0.3
                specular 0.5
        }
        
        scale 0.35
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

fou(<0,0,0>,<1,1,1>,90*y)   
*/