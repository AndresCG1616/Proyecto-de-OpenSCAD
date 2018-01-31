
//Parámetros

/*
lado=500;
espesor=5;
numdiente=8;
tamdiente=lado/numdiente;

ladoY=200;
numdienteY=4;
tamdienteY=ladoY/numdienteY;
*/

//CUBO Parametros
/*
cuboX=100;
cuboY=200;
cuboZ=150;
espesor=5;
numCubos=3;
*/

//Modulo

module piezaR(lado=100,ladoY=200,numdiente=4,numdienteY=4,espesor=5){
    
//Parametro calculados

tamdiente=lado/numdiente;    
tamdienteY=ladoY/numdienteY;

//Base (cuadrado)

square([lado,ladoY],center=true);

//Primera generación de dientes (ESI)

translate([(-lado/2),ladoY/2])
//square([tamdiente,espesor]);

    for(i=[0:(numdiente/2)-1]){
    
    translate([i*2*tamdiente,0])
    square([tamdiente,espesor]);
    
    }

//Segunda generación de dientes (ESD)

 translate([lado/2,ladoY/2])
 rotate(-90)   

    for(i=[0:(numdienteY/2)-1]){
    
    translate([i*2*tamdienteY,0])
    square([tamdienteY,espesor]);
    
    }

//Tercera generación de dientes (EID)    
    
translate([(lado/2),(-ladoY/2)])
rotate(-180)   

    for(i=[0:(numdiente/2)-1]){
    
    translate([i*2*tamdiente,0])
    square([tamdiente,espesor]);
    
    }

//Cuarta generación de dientes (EII)    
    
translate([(-lado/2),(-ladoY/2)])
rotate(-270)   
    
    for(i=[0:(numdienteY/2)-1]){
    
    translate([i*2*tamdienteY,0])
    square([tamdienteY,espesor]);
    
    }    
    
} //Llave del modulo



/* ### piezaR ###
 
La "piezaR" es un modelo rectangular con medidas parametrizables, su función es diseñar piezas adecuadas para un uso posterior, está pensada para un uso de ensamblaje por lo cual tiene implementado como parámetro "dientes".

### Cómo crear una instancia de piezaR ###

 La sintaxis de instancia es de la siguiente forma:

 Nombre_Modulo(Var1,Var2,...);

El nombre de nuestro modulo es piezaR y las variables están en este orden:

piezaR(lado,ladoY,numdiente,numdienteY,espesor);

El orden de los parámetros es MUY importante por lo cual se debe respetar al momento de crear una piezaR, a continuación se da una breve explicación de cada parámetro (la lista está en orden con respecto al modulo)

1. lado= Es el parámetro que indica el tamaño de la base de nuestro     "rectangulo".

2. ladoY= Es el parámetro que indica la altura de nuestro "rectangulo".

3. numdiente= es el numero de ESPACIOS que se generará en la parte inferior y superior de la pieza, es decir que el número de DIENTES en cada lado (inferior y superior)de nuestra pieza será la mitad de este número, por lo cual se recomienda utilizar valores PARES.

4. numdienteY= es el numero de ESPACIOS que se generará en la parte izquierda y derecha de la pieza, es decir que el número de DIENTES en cada lado (derecho e izquierdo) de nuestra pieza será la mitad de este número, por lo cual se recomienda utilizar valores PARES.

5. espesor= Es el parámetro encargado de definir la altura de los "dientes" en nuestra pieza.

*/

//Cubo

module cubos(cuboX=100,cuboY=200,cuboZ=150,espesor=5,numCubos=3)
{


//Prueba de for
for(i=[0:((numCubos*2)-1)])
{
    //Pieza XY (Izquierda)

translate([-(cuboX)-(4*espesor),i*((cuboY)+(4*espesor))])
piezaR(cuboX,cuboY,8,8,5);
    
    }
    
    
for(i=[0:((numCubos*2)-1)])
{
   //Pieza YZ (Derecha)

translate([(cuboX/2)+(cuboY/2)+(4*espesor),i*((cuboZ)+(4*espesor))])
piezaR(cuboY,cuboZ,8,8,5);
    
    }    

for(i=[0:((numCubos*2)-1)])
{
   //Pieza XZ (Central)

translate([0,i*((cuboZ)+(4*espesor))])
piezaR(cuboX,cuboZ,8,8,5);
    
    }   
} // LLAVE DEL MODULO cubos




3D=0;

cuboX=100;
cuboY=200;
cuboZ=150;
espesor=5;
numCubos=3;

if(3D==0){
    
cubos(cuboX,cuboY,cuboZ,espesor,numCubos); 

}

else{
    
    cube([cuboX,cuboY,cuboZ],center=true);
    
    }
    
    
    
    
/* ### Cubo ###  */

/*############# CASO PARA 1 CUBO##################
    
//Pieza XZ (Central)

piezaR(cuboX,cuboZ,8,8,5);

translate([0,(cuboZ)+(4*espesor)])
piezaR(cuboX,cuboZ,8,8,5);

//Pieza YZ (Derecha)

translate([(cuboX/2)+(cuboY/2)+(4*espesor),0])
piezaR(cuboY,cuboZ,8,8,5);

translate([(cuboX/2)+(cuboY/2)+(4*espesor),(cuboZ)+(4*espesor)])
piezaR(cuboY,cuboZ,8,8,5);

//Pieza XY (Izquierda)

translate([-(cuboX)-(4*espesor),0])
piezaR(cuboX,cuboY,8,8,5);

translate([-(cuboX)-(4*espesor),(cuboY)+(4*espesor)])
piezaR(cuboX,cuboY,8,8,5);
*/




    