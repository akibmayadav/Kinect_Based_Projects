//******* FINAL PROJECT : FINAL CONCEPT (Simulating Ames Room Mirroring Effect) ******//
//* Ambika Yadav *//

import SimpleOpenNI.*;
SimpleOpenNI kinect;

boolean tracking = false;
int userID;
int[] userMap;
int user_max;

float a,resize_index;

PImage final_image;

int kinect_width = 640;
int kinect_height = 480;

void setup() {
  
size(1280,960);
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
 final_image= createImage(kinect_width, kinect_height, RGB);
 user_max = 0;
 
 if(kinect.getNumberOfUsers() > 0) 
 {  
    userMap = kinect.userMap();   
    loadPixels();
    for (int x = 0; x < kinect_width; x++) 
    {
      for (int y = 0; y < kinect_height; y++) 
      {
        int loc = x + y * kinect_width;
        if (userMap[loc] !=0) 
        {        
         if (x>user_max)
           {
             user_max = x;
           }  
           
          final_image.pixels[loc] = rgbImage.pixels[loc];
        }
      }
  }   
  
  a = map(user_max,0,640,0,20);
  resize_index = 20-a;
  final_image.updatePixels();
  final_image.resize(int(2560/resize_index),int(1920/resize_index));
  image(final_image,0,960-int(1920/resize_index) );
  
  for (int x = 0; x < width; x=x+10) 
    {
      for (int y = 0; y < height; y=y+10) 
      {
        int loc = x + y * width; 
        
        fill( pixels[loc]);
        ellipse (x,y,10,10);
        
      }
    }
  }
 }

