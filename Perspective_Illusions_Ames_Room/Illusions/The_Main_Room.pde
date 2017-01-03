void main_room()
{
     pushMatrix(); 
     fill(105,188,203);
     translate(0,0,(closestValuez-2500)*3);
     rotateY((320-closestValuex)*PI/5000);
     box(1000,1000,10000);
     pushMatrix();
     fill(255);
     box(100);
     translate(0,0,-4000);
     popMatrix();
     popMatrix();
  
}
