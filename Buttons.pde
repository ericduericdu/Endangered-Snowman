class Menu
{
  boolean showRules = false;
  boolean music = true;
  int cx = width/2;
  int cy = height/2;
  int butX = 300;
  int butY = 75;
  color pbox;
  color ptext;
  
  int wb = 255;
  int wb2 = 255;
  
  color wb3 = color(0);
  Menu()
  {
    textAlign(CENTER);
    rectMode(CENTER);
  }
  void startDisplay()
  {
    stroke(0);
    background(#ACF4FA);
    textFont(f);
    fill(0);
    text("ENDANGERED SNOWMAN", width/2, height/2-150);

    if (mouseX > cx - butX/2 && mouseX < cx + butX/2 && mouseY >  cy - butY/2 && mouseY < cy + butY/2) //invert button if pressed
      wb = 0;
    else if (mouseX > cx - butX/2 && mouseX < cx + butX/2 && mouseY >  (cy+100) - butY/2 && mouseY < (cy+100) + butY/2)  //invert button if pressed
      wb2 = 0;
    else
      wb = wb2 = 255;

    fill(wb);
    rect(cx, cy, butX, butY);

    textFont(f,15);
    fill(0);
    text("Press 'S' to toggle music", width-110, 20);
    
    textFont(f,48);
    fill(255-wb);
    text("PLAY", cx, cy+20);
    
    fill(wb2);
    rect(cx, cy+100, butX, butY);
    
    fill(255-wb2);
    text("RULES", cx, cy+120);
    
    fill(0);
    textFont(f,14);
    if(showRules)
    {
      text("Watch out for the shards. Hit 3 and you'll melt.", cx, cy+155);
      text("Some shards may speed it up or slow it down.", cx, cy+172);
    }

    fill(0);
    text("By Eric Du, Abbas Khan, Iran Martinez, Omid Izadjou, Amos Kwok", width/2, height-10);
  }
  
  void endDisplay()
  {
    if (mouseX > cx - butX/2 && mouseX < cx + butX/2 && mouseY >  cy - butY/2 && mouseY < cy + butY/2)
      wb3 = color(0);
    else
      wb3 = color(#ACF4FA);
      
    textFont(f,48);
    fill(wb3);
    text("EXIT", cx, cy+20);
    
    textFont(f,100);
    fill(0);
    text(gameScore/60, cx, cy-100);
  }
}

void mouseReleased()
{
  if (mouseX > menu.cx - menu.butX/2 && mouseX < menu.cx + menu.butX/2 && mouseY >  menu.cy - menu.butY/2 && mouseY < menu.cy + menu.butY/2 && !start)  //start game
  {  
    start = true;
    menu.showRules = false;
  }
  if (mouseX > menu.cx - menu.butX/2 && mouseX < menu.cx + menu.butX/2 && mouseY >  (menu.cy+100) - menu.butY/2 && mouseY < (menu.cy+100) + menu.butY/2 && !start)  //show rules
    menu.showRules = true;
  if (mouseX > menu.cx - menu.butX/2 && mouseX < menu.cx + menu.butX/2 && mouseY >  menu.cy - menu.butY/2 && mouseY < menu.cy + menu.butY/2 && start && end)  //exit to main menu
  {
    start = false;
    end = false;
  }
}

//music
void keyPressed()
{
  if(key == 's')
  {
    if(menu.music)
      file.stop();
    else
      file.play();
      
    menu.music = !menu.music;
  }
}