/*
StarterHacks Project
1/18/2020
Ben Zeng, Oscar Han, Ronald You, Brian Kang
*/
final int CLICK_DELAY = 50;
int cur = 0, prev = 0;
private int timeSinceLastClick = 0;
Screen[] screens = new Screen[1];
/* Main Methods */
void setup()
{
  fullScreen();
  screens[0] = new MainMenu();
}
void draw()
{
  timeSinceLastClick++;
  if(prev != cur) /* When a screen is switched */
  {
    screens[prev].onScreenEnd();
    screens[cur].onScreenStart();
    prev = cur;
  }
  screens[cur].display();
}
void mouseClicked()
{
  if(timeSinceLastClick >= CLICK_DELAY)
  {
    screens[cur].onClick();
    timeSinceLastClick = 0;
  }
}
