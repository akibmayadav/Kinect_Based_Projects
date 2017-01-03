// ** Final Project : Concept 1 (Build of You See You ) ******//
//** ILLUSIONS   **//
//** Ambika Yadav **//

import SimpleOpenNI.*;
SimpleOpenNI kinect;
int opacityrand[];
PImage image[];
int closestValuex,closestValuey,closestValuez;
void setup()
{
 size(1000,1000,P3D);
 background(255,255,255);
 
 kinect = new SimpleOpenNI(this);
 kinect.enableDepth();
 
 image = new PImage[1024];
 opacityrand = new int[1024];
 for (int i = 0 ; i <1024 ;i++)
 {
   opacityrand[i] = int(random(10,30)); 
 }
 
}
void draw()
{
 closestValuez = 8000;
  kinect.update();
  int[] depthValues = kinect.depthMap();
    for(int y = 0; y < 480; y++)
    {
      for(int x = 0; x < 640; x++)
      {
        int i = x + y * 640;
        int currentDepthValue = depthValues[i];
        if(currentDepthValue > 0 && currentDepthValue < closestValuez)
        {
          closestValuez = currentDepthValue;
          closestValuex = x ;
          closestValuey = y ; 
        }
      }
    }
  
 background(85,85,85);
 translate(500,480,4000);
 for (int i=0 ;i<32;i++)
 {
   for (int j=0 ;j<32;j++)
   {
    if ( closestValuez < 3500)
    {
      main_room();
      room_elements();
    }
   }
 }
 
}
