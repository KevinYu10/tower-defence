

final int INTRO         = 0;
final int GAME          = 1;
final int GAMEOVER      = 2;
final int BUILD         = 4;
final int MAPSELECTION  = 5;
int mode;

final int up     = 0;
final int down   = 1;
final int left   = 2;
final int right  = 3;

boolean mouseReleased;
boolean wasPressed;

PImage[] gif;
int speed;

PImage nextWave;

color white        = #FFFFFF;
color yellow       = #FFFF00;
color green        = #00FF00;
color red          = #FF0000;
color blue         = #00FFFF;
color darkBlue     = #0000FF;
color pink         = #FF00FF;
color black        = #000000;
color brown        = #A7910F;
color purple       = #911FDE;
color lightPurple  = #CC91F7;

Gif introGif;
Button introButton, gamePauseButton, gameWaveButton, pauseGameButton, gameBuildButton, buildGameButton, gunTowerBuilding, aoeTowerBuilding, sniperTowerBuilding;
Button map1Button, map2Button, returnButton, resetButton, waveLevelButton, waveResetButton;
Node[] node1, node2;
ArrayList <Mob> mobs;
int waveNumber = 1;    // the number of mobs in a wave
int waveLevel = 1;
ArrayList <GunTower> gunTowers;
ArrayList <AoeTower> aoeTowers;
ArrayList <SniperTower> sniperTowers;
ArrayList <Bullet> bullets;

//game features
int lives;
int money;
int map;
PImage map1bg, map2bg;

void setup() {

  size(1000, 800);
  mode = INTRO;

  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  lives = 3;
  //initial money
  money = 50;

  nextWave = loadImage("next-wave.png");
  map1bg = loadImage("map1background.jpeg");
  map2bg = loadImage("map2background.jpeg");

  images();
  buttons();
  nodes();
  gameMob();
  gameTower();
  gameBullet();
}

void gameMob() {
  mobs = new ArrayList<Mob>();
}

void buttons() {
  //button(text/variable, central x, y, w, h, background color, text color);
  introButton = new Button("Start", width/2, height/1.6, 200, 100, white, blue);
  gameWaveButton = new Button(nextWave, 900, 250, 100, 100, green, red);
  gameBuildButton = new Button("Build", 900, 100, 100, 80, white, red);
  buildGameButton = new Button("Game", 900, 100, 100, 80, white, red);
  gunTowerBuilding = new Button("Gun\n20$", 900, 200, 100, 80, #383CDE, #DE3859);
  aoeTowerBuilding = new Button("Aoe\n50$", 900, 300, 100, 80, #3ED33F, #D3D33E);
  sniperTowerBuilding = new Button("Sniper\n100$", 900, 400, 100, 80, #A53CCB, #3CCBCA);
  map1Button = new Button("Map1", 250, height/3, 200, 100, white, red);
  map2Button = new Button("Map2", 750, height/3, 200, 100, white, red);
  returnButton = new Button("Return", 900, 700, 100, 80, white, red);
  resetButton = new Button("Reset", 900, 600, 100, 80, white, red);
  waveResetButton = new Button("Wave\nReset", 900, 400, 100, 80, white, red);
}

void images() {
  //gif(text before number, after, number of frames, speed(1 fastest),central x, y, w, h);
  introGif = new Gif("frame_", "_delay-0.11s.gif", 18, 5, width/2, height/2, width, height);
}

void gameTower() {
  gunTowers = new ArrayList <GunTower>();
  sniperTowers = new ArrayList <SniperTower>();
  aoeTowers = new ArrayList <AoeTower>();
}

void gameBullet() {
  bullets = new ArrayList <Bullet>();
}

void nodes() {
  //node(x, y, w, h);
  //first map
  node1 = new Node[8];
  node1[0] = new Node(0, 300, 10, 10);
  node1[1] = new Node(250, 300, 10, 10);
  node1[2] = new Node(250, 100, 10, 10);
  node1[3] = new Node(450, 100, 10, 10);
  node1[4] = new Node(450, 700, 10, 10);
  node1[5] = new Node(250, 700, 10, 10);
  node1[6] = new Node(250, 500, 10, 10);
  node1[7] = new Node(800, 500, 10, 10);

  //second map
  node2 = new Node[8];
  node2[0] = new Node(0, 300, 10, 10);
  node2[1] = new Node(450, 300, 10, 10);
  node2[2] = new Node(450, 100, 10, 10);
  node2[3] = new Node(250, 100, 10, 10);
  node2[4] = new Node(250, 700, 10, 10);
  node2[5] = new Node(450, 700, 10, 10);
  node2[6] = new Node(450, 500, 10, 10);
  node2[7] = new Node(800, 500, 10, 10);
}


void draw() {
  click();
  if (mode == INTRO)             intro();
  else if (mode == GAME)         game();
  else if (mode == GAMEOVER)     gameover();
  else if (mode == BUILD)        build();
  else if (mode == MAPSELECTION) mapSelection();
  //println(mode);
  //println(frameRate);
  //textSize(20);  
  //text(mouseX+","+mouseY, mouseX, mouseY-20);
  waveLevelButton = new Button("Level: "+waveLevel, 900, 500, 100, 80, white, red);
}
