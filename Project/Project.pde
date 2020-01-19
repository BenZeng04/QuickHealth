/*
StarterHacks Project
1/18/2020
Ben Zeng, Oscar Han, Ronald You, Brian Kang
main menu
*/
final int CLICK_DELAY = 50;
private int timeSinceLastClick = 0;
boolean isClient;
boolean signedIn;
Client thisClient = null;
Doctor thisDoctor = null;

/* Main Methods */
void setup() {
  fullScreen();
  // Setup of user
  String[] info = loadStrings("Information.txt");
}
