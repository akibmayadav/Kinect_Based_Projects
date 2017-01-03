PImage image[];
void setup()
{
 size(1000,1000);
 background(255,255,255);
 image = new PImage[100];
 
 for (int i=0 ;i<10;i++)
 {
   for (int j=0 ;j<10;j++)
 {
   String finalname = "AmericanGothic [www.imagesplitter.net]-"+ str(i) + "-" +str(j) + ".jpeg";
   println(finalname);
   image[i+10*j]= loadImage(finalname);
 }
 }
}
void draw()
{
  tint(255, 250);
  background(255,255,255);
  for (int i=0 ;i<10;i++)
 {
   for (int j=0 ;j<10;j++)
   {
    image(image[i+10*j],j*100.4,i*121);  
   }
 }
}
