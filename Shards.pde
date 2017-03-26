
class Shards
{
  float x = random(-20,width+20);
  float y = random(-height);
  float xtip = x+13;
  float ytip = y+100;
  
  void drop(int i)
  {
    ytip = y+100;
    xtip = x+13;
    y += dropRate;
    
    if(i == 0)
      fill(#E9B2FF);
    else
      fill(255,200);
      
    stroke(75);
    triangle(x, y, xtip, ytip, x+26, y);

    if (y > height)
    {
      x = random(-20,width+20);
      y = random(-height);
    }
  }
}