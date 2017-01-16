#macro tour(position,couleur)

union {        
        torus { 1, 0.1 }               
        torus { 1.1, 0.2
                translate 0.3*y }   
                     
        cylinder { <0,0,0>, <0,0.3,0>, 1
                translate 0.4*y }
                
        cone {  <0,0,0>, 0.7, <0,2.2,0>, 0.3
                translate 0.6*y }    
        cone  { <0,0,0>, 0.3, <0,0.3,0>, 0.5
                translate 2.8*y }   
        cylinder { <0,0,0>, <0,0.2,0>, 0.3
                translate 3.1*y } 
        difference {              // tete de la tour       
                cylinder {
                        <0,0,0>
                        <0,0.6,0>
                        0.7
                        translate 3.3*y
                        }              
                cylinder {
                        <0,0,0>
                        <0,0.6,0>
                        0.5
                        translate 3.4*y
                        }
                         
                box {
                        <-1,0,0>
                        <1,0.5,0.4>
                        translate <0,3.6,-0.2>
                        }
                box {
                        <-1,0,0>
                        <1,0.5,0.4>
                        translate <0,3.6,-0.2> rotate 90*y
                        }
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

tour(<0,0,0>,<1,1,1>)
      */ 