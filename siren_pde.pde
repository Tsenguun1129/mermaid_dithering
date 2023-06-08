PImage siren;
  void setup() {
    siren = loadImage("siren.png");
    size (6000,6000);
    siren.filter(GRAY); 
   //image(siren,0,0);
  }
  
  int index (int x, int y) {
    return x + y * siren.width;
    
  }
  
   void draw() {
     siren.loadPixels();
     for (int y = 0; y < siren.height-1; y++) {
     for (int x = 1; x<siren.width-1; x++) {
         int index = x + y * siren.width;
         color pix = siren.pixels[index(x,y)];
         
         float oldR = red (pix);
         float oldG= green(pix);
         float oldB = blue (pix);
         int factor = 4;
         int newR = round(factor * oldR / 255) * (255/factor);
         int newG = round(factor * oldG / 255) * (255/factor);
         int newB = round(factor * oldB / 255) * (255/factor);
         siren.pixels[index(x,y)] = color(newR,newG,newB);
         
         float errR = oldR - newR;
         float errG = oldG - newG;
         float errB = oldB - newB;
         
         index = index(x+1,y);
         color c = siren.pixels[index];
         float r = red(c);
         float g = green(c);
         float b = blue (c);
         r = r + errR * 7/16.0;
         g = g + errG * 7/16.0;
         b = b + errB * 7/16.0;
         siren.pixels[index] = color(r,g,b);
         
         
         index = index(x-1,y+1);
         c = siren.pixels[index];
         r = red(c);
         g = green(c);
         b = blue (c);
         r = r + errR * 3/16.0;
         g = g + errG * 3/16.0;
         b = b + errB * 3/16.0 ;
         siren.pixels[index] = color(r,g,b);
         
         
         index = index(x,y+1);
         c = siren.pixels[index];
         r = red(c);
         g = green(c);
         b = blue (c);
         r = r + errR * 5/16.0;
         g = g + errG * 5/16.0;
         b = b + errB * 5/16.0;
         siren.pixels[index] = color(r,g,b);
         
         
         index = index(x+1,y+1);
         c = siren.pixels[index];
         r = red(c);
         g = green(c);
         b = blue (c);
         r = r + errR * 1/16.0;
         g = g + errG * 1/16.0;
         b = b + errB * 1/16.0;
         siren.pixels[index] = color(r,g,b);
         
         
  
         
       }
    }
     siren.updatePixels();
     image(siren, 512, 0);
     save ("dithered_image.png");
   }
   
   

    
