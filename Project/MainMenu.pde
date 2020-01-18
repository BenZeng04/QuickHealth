class MainMenu extends Screen
{
  PFont mainFont = loadFont("MicrosoftTaiLe-Bold-48.vlw");
  PImage mainIcon = loadImage("Home.png");
  int timer = 0;
 
  /* Constructor */
  public MainMenu()
  {
    background = loadImage("Main.png");
    background.resize(width, height);
    mainIcon.resize(50, 50);
  }
  /* Relevant Events */
  public void display()
  {
    // Display
    title();
    header();
    // Logicsics
    timer++;
  }
  public void onClick()
  {
    
  }
  public void onScreenStart() 
  {
    timer = 0;
  } 
  /* Irrelevant Events */
  public void onScreenEnd() {} 
  /* Other Methods */
  private void title()
  {
    background(background);
    textFont(mainFont);
    rectMode(CENTER);
    noStroke();
    // Title Background
    fill(#0042AA, 100);
    rect(600, 125, 800, 150);
    // Title Outline
    fill(100, 190);
    rect(600 + 3, 50 + 3, 800, 10);
    rect(600 + 3, 200 + 3, 800, 10); 
    fill(255);
    rect(600, 50, 800, 10);
    rect(600, 200, 800, 10);
    // Title Text
    textAlign(LEFT, CENTER);
    textSize(44);
    fill(100, 190);
    text("-  P  A  R  A  G  R  A  Z  E  R  !  -", 220 + 3, 100 + 3);
    fill(255);
    text("-  P  A  R  A  G  R  A  Z  E  R  !  -", 220 , 100);
    // Team Text
    textAlign(RIGHT, CENTER);
    textSize(27);
    fill(100, 190);
    text("S T A R T E R  H A C K S", 980 + 3, 160 + 3);
    fill(#002A6C);
    text("S T A R T E R  H A C K S", 980 , 160);
  }
  private void header()
  {
    rectMode(CORNER);
    imageMode(CENTER);
    // Buttons
    noStroke();
    fill(touchingRectangle(150, 220, 450, 60)? #AFCEFF: #002A6C, 100);
    rect(150, 220, 450, 60);
    fill(touchingRectangle(600, 220, 450, 60)? #AFCEFF: #002A6C, 100);
    rect(600, 220, 450, 60);
    // Header
    fill(255);
    rect(150, 280, 900, 5); 
    fill(#5D5D5D);
    rect(150, 280, 450, 5);
    // Icons
    image(mainIcon, 375, 245);
  }
  private boolean touchingCircle(float circleX, float circleY, float diam)
  {
    return dist(mouseX, mouseY, circleX, circleY) <= (diam / 2);
  }
  private boolean touchingRectangle(float rectX, float rectY, float w, float h)
  {
    return mouseX > rectX && mouseY > rectY && mouseX < rectX + w && mouseY < rectY + h;
  }
}
