//** FINAL PROJECT : CONCEPT 2 (MIRRORS ) ***//
//** Ambika Yadav **//


import SimpleOpenNI.*;
SimpleOpenNI kinect;

boolean tracking = false;
int userID;
int[] userMap;
int user_max;

float a,resize_index;

int kinect_width = 640;
int kinect_height = 480;

void setup() {
  
size(1280,1000);
kinect = new SimpleOpenNI(this);
kinect.enableDepth();
kinect.enableRGB(); 
kinect.enableUser();
kinect.alternativeViewPointDepthToImage(); 

}
void draw() {  
  
 kinect.update();  
 background(0);
 smooth(); 
 
 PImage rgbImage = kinect.rgbImage(); 
 
 rgbImage.loadPixels();
 loadPixels();
 user_max = 0;
 
 if(kinect.getNumberOfUsers() > 0) 
 {  
    userMap = kinect.userMap();   
    loadPixels();
    for (int x = 0; x < kinect_width; x=x+10) 
    {
      for (int y = 0; y < kinect_height; y=y+10) 
      {
        int loc = x + y * kinect_width;
        if (userMap[loc] !=0) 
        {        
          fill(rgbImage.pixels[loc]);
          ellipse(2*x,2*y,10,10);
        }
        else
        {
          fill(255,255,255);
          ellipse(2*x,2*y,10,10);
        }
      }
  }  
  
 }
 
}
