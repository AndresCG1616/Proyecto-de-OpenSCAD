radiot=4;
radio=10;

minkowski(){

difference(){
    
    
    circle(r=radio,$fn=90);
    
    difference(){


circle(r=radio,$fn=90);

for(i=[0:4]){
    
rotate((360/5)*i)    
translate([radio-(radiot),0])
circle(r=radiot,$fn=3);
}

circle(r=5.1,$fn=90);
}
    
    }
    
    
circle(r=1,$fn=90);    
    
    
} //llave del min