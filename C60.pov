#include "colors.inc"
#include "textures.inc"
#include "math.inc"
#include "functions.inc"
#include "transforms.inc"

// ----------------------------------------------------------------------------
//light_source{<1000,0,0> color White}
light_source{<0,1000,0> color Goldenrod}
light_source{<1000,1000,-1000> color Goldenrod}
//light_source{<1000,1000,-1000> color <240/255,162/255,214/255>}
// ----------------------------------------------------------------------------
background{color White}
#declare Camera_0 = camera{  angle 75
                             location        <0,6,6.5>
                             right           x*image_width/image_height
                             look_at         <0,3,3.5>};
//-----------------------------------------------------------------------------
#declare r = 0.3;                       // radio de la esfera
#declare n = 5;                         // numero de puntos
#declare i = 0;                         // indice

#declare pos = array[12];               // arreglo de posiciones
#fopen outFile "c60.xyz" write          // archivo de salida
#write(outFile, 60,"\n#\n")  

#declare mystring = " ";
#fopen archivo "/home/raul/Desktop/QC/S1/ico/ico.txt" read

//  ------------    COPIANDO POSICIONES ICO     ----------------
#while(i<12)
    #read(archivo, mystring, x0, y0, z0)
    #declare pos[i] = <x0,y0,z0>;
    #declare i = i+1;
#end

//  ------------    CALCULANDO POSICIONES C60   ------------------
#for(i,0,11)
    #for(j,i,11)
        #declare d = VDist(pos[i],pos[j]);
        #if (d<4.25 & d!=0)
            #declare c60 = pos[i] + (pos[j]-pos[i])/3;            
            #write (outFile, "C ",vstr(3,c60," ",7,5),"\n")
            sphere{ c60, r 
                    texture{pigment{color NeonPink}
                            finish{ diffuse 0.8616
                            specular 0.7196}                    
                            }
                    }
            #declare c60 = pos[i] + 2*(pos[j]-pos[i])/3;
            #write (outFile, "C ",vstr(3,c60," ",7,5),"\n")      
            sphere{ c60, r 
                    texture{pigment{color NeonPink}
                            finish{ diffuse 0.8616
                            specular 0.7196}                    
                            }
                    }    
        #end              
    #end
#end

/*
#for(i,0,11)
    #write (outFile, "N ",vstr(3,pos[i]," ",7,5),"\n")
#end
*/


camera{Camera_0}
