class MainMenu extends Screen
{
  /* Constructor */
  public MainMenu()
  {
    background = loadImage("Main.png");
    background.resize(width, height);
  }
  /* Relevant Events */
  public void display()
  {
    background(background);
    
  }
  public void onClick()
  {
  }
  /* Irrelevant Events */
  public void onScreenStart() {} 
  public void onScreenEnd() {}
}
