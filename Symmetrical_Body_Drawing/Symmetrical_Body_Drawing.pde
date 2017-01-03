import SimpleOpenNI.*;
SimpleOpenNI kinect;

int closestValue;
int closestX;
int closestY;
float lastX;
float lastY;
float lastZ;
int hex_side = 300;
int window_w = int(2*(sqrt(3)/2)*hex_side);
int window_l = 2*hex_side ;

void setup()
{
size(window_w+200,window_l+200);

background(50);
kinect = new SimpleOpenNI(this);
kinect.enableDepth();


}
void draw()
{
translate(100,100);
closestValue = 8000;
kinect.update();
int[] depthValues = kinect.depthMap();
for(int y = 0; y < 480; y++)
{
for(int x = 0; x < 640; x++)
{ 
int reversedX = 640-x-1; 
int i = reversedX + y * 640;
int currentDepthValue = depthValues[i];
if(currentDepthValue > 610 && currentDepthValue < 1525 
&& currentDepthValue < closestValue){
closestValue = currentDepthValue;
closestX = x;
closestY = y;
}
}
}
float closestValue1 = map (closestValue, 610,1526,-10,0);
float interpolatedX = lerp(lastX, closestX, 0.3f); 
float interpolatedY = lerp(lastY, closestY, 0.3f);
float interpolatedZ = lerp(lastZ,closestValue1,0.3f);
drawing_lines(lastX, lastY, interpolatedX, interpolatedY);

lastX = interpolatedX;
lastY = interpolatedY;
lastZ = interpolatedZ;
}

