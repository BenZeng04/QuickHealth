abstract class Screen /* General layout for a screen. DO NOT modify! */
{
  PImage background; 
  abstract void display();
  abstract void onClick();
  abstract void onScreenStart();
  abstract void onScreenEnd();
}
