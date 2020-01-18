int currScreen = 0;
Screen[] screens = new Screen[1];

void setup()
{
  fullScreen();
  screens[0] = new MainMenu();
}
void draw()
{
  screens[currScreen].display();
}
