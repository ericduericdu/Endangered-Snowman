import processing.sound.*;
SoundFile file;
//add sound
//add slowdown

PImage img;
Snowman sm;
Shards [] shardArr;
Menu menu;
int numShards = 22;
PFont f;
int currX;
int currY;
boolean start = false;
boolean end = false;
int invTime = 3;
int gameScore = 0;
int dropRate = 5;
String sound = "background.mp3";

int difficultyIncreaseRate = 20;
int difficultyIncreaseRateByFrame = int(frameRate) * difficultyIncreaseRate;

void setup()
{

  size(800, 800);
  
  img = loadImage("glacier.jpg");
  
  //SOUND
  String abs = dataPath("");
  String [] ind = split(abs,"/");

  String abspath = "";
  for(int i = 0; i < ind.length-1; i++)
  {
    if(i == 0)
      abspath += ind[i];
    else
      abspath += "/" + ind[i];
  }
  abspath += "/" + sound;
  file = new SoundFile(this, abspath);
  file.loop();
  //SOUND
  
  //shar array
  shardArr = new Shards[numShards];
  
  //start and end menu
  menu = new Menu();
  
  //characters
  sm = new Snowman();
 
  for (int i = 0; i < numShards; i++)
    shardArr[i] = new Shards();

  f = loadFont("Chalkduster-48.vlw");
}

void draw()
{  
  //start menu
  if(!start && !end)
  {
    gameScore = 0;
    menu.startDisplay();
    restartGame();
  }
  else if(start && !end)  //game play
  {
    noCursor();
    startGame();
  }
  else if(start && end)  //end menu
  {
    cursor();
    menu.endDisplay();
  }
}

void startGame()
{
  background(img);
  score();
  sm.character();
  
  //drop shards
  for(int i = 0; i < numShards; i++)
  {
    shardArr[i].drop(i);
    currY = int(shardArr[i].ytip);
    currX = int(shardArr[i].xtip);
    
    if(dist(currX,currY,sm.x,sm.y) < 20 && !sm.invisible)  //if it hits snowmans head
    {
      if(i == 0)      //if special shard
      {
        if(int(random(0,2)) == 0)  //50/50 speed up or slow down
          dropRate = 5;
        else
          dropRate += 2;
      }
      else  //lose life if hit
        sm.lostLife(frameCount);
    }

  }
  
  levelIncrease();  //increased speed as you progress
}

void levelIncrease()
{
  if(frameCount%difficultyIncreaseRateByFrame == 0 && gameScore != 0)
    dropRate += 1;
}

//increase score every second
void score()
{
  gameScore = gameScore+1;  
  fill(0);
  textSize(32);
  text(gameScore/60, width-50,35);
}

//when the game is over, restart for next round
void restartGame()
{
  sm.lives = 3;
  sm.invisible = false;
  gameScore = 0;
  dropRate = 5;
  for (Shards shard : shardArr)
  {
    shard.y = random(-height);
  }
}