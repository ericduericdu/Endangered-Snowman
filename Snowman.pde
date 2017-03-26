class Snowman
{
  int x;
  int y;
  int top;
  int mid;
  int bot;
  int eyes;
  int nose;
  int lives;
  int incount;
  boolean invisible;

  Snowman()
  {
    y = 675;
    top = 40;
    mid = top+10;
    bot = top+30;
    eyes = top-50;
    nose = top-50;
    invisible = false;

    lives = 3;
  }

  void character()
  {
      x = mouseX;
      fill(255);
      stroke(0);
      ellipseMode(CENTER);
      
      ellipse(mouseX, y, top, top);            //top
      
      if(lives >= 2)
        ellipse(mouseX, y+40, mid, mid);        //middle
      if(lives >= 3)  
        ellipse(mouseX, y+90, bot, bot);       //bottom
      
      fill(0);            
      ellipse(mouseX-10, y-5, eyes, eyes);      //left eye
      ellipse(mouseX+10, y-5, eyes, eyes);      //right eye
  
      fill(255, 153, 51);    
      ellipse(mouseX, y+5, nose, nose);      //nose 
      //noCursor();
      
      shield();
      if((frameCount-incount) > invTime * frameRate)
        invisible = false;
  }
  
  void shield()  //display shield
  {
    rectMode(CENTER);
    fill(#ACF4FA, 150);
    noStroke();
    if(invisible)  
      rect(x,y+40, 100,200);
  }
  
  void lostLife(int count)
  {
    incount = count;  //invisible for 3 secs, if invisible, can't die
    if(!invisible)
    {
      lives--;
      if(lives == 0)
        end = true;
      invisible = true;
    }
  }
}