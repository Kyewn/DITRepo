color[] jjtPalette = {
#7C7C7C, #0000FC, #0000BC, #4428BC, #940084, #A80020, #A81000,
#881400, #503000, #007800, #006800, #005800, #004058, #BCBCBC, #0078F8,
#0058F8, #6844FC, #D800CC, #E40058, #F83800, #E45C10, #AC7C00, #00B800,
#00A800, #00A844, #008888, #F8F8F8, #3CBCFC, #6888FC, #9878F8, #F878F8,
#F85898, #F87858, #FCA044, #F8B800, #B8F818, #58D854, #58F898, #00E8D8,
#787878, #FCFCFC, #A4E4FC, #B8B8F8, #D8B8F8, #F8B8F8, #F8A4C0, #F0D0B0,
#FCE0A8, #F8D878, #D8F878, #B8F8B8, #B8F8D8, #00FCFC, #F8D8F8, #000000
};

PImage catImage;

void setup() {
  size(440, 346);
  catImage= loadImage("cat.png");
  catImage.resize(width, height);
  
  //loop over pixels and apply filter to each pixel
  for(int y = 0; y < catImage.height; y++){
   for(int x = 0; x < catImage.width; x++){
     color in = catImage.get(x, y);
     color out = getClosestjjtColor(in);
     catImage.set(x, y, out);
   }
  }
  
  noLoop();
}


color getClosestjjtColor(color in){
  
  float inRed = red(in);
  float inGreen = green(in);
  float inBlue = blue(in);
  
  color out = in;
  float minColorDistance = 100000;
 
  for(color jjtColor : jjtPalette){
    
    float nesRed = red(jjtColor);
    float nesGreen = green(jjtColor);
    float nesBlue = blue(jjtColor);
    

    float colorDistance = dist(inRed, inGreen, inBlue, nesRed, nesGreen, nesBlue);
    
    if(colorDistance < minColorDistance){
      out = jjtColor;
      minColorDistance = colorDistance;
    }
  }
  
  return out;
  
}

void draw() {
  image(catImage, 0, 0);
}
