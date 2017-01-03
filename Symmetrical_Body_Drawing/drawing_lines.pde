void drawing_lines(float x,float y , float x_l, float y_l )
{
  float line1 = (y-window_l/2)-(tan(PI/6)*(x-window_w/2));
  float line2 = (y-window_l/2)+(tan(PI/6)*(x-window_w/2));
  if ((line1<0)&&(line2>0))
  {
    float r = random(0,255);
    float g = random(0,255);
    float b = random(0,255);
    stroke(r,g,b);
    strokeWeight(4);
    beginShape();
    vertex(x_l,y_l);
    vertex(x,y);
    endShape();
    
    
    for( int i =1 ; i<6 ; i ++)
    {
    pushMatrix();
    translate(window_w/2,window_l/2);
    rotate(i*PI/3);
    translate(-window_w/2,-window_l/2);
    beginShape();
    vertex(x_l,y_l);
    vertex(x,y);
    endShape();
    popMatrix();
    }

  }
}
