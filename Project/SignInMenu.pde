private String username = "";
private String password = "";
private int signUpMenu = 0;
private int typingMode = 0; 
// 5353
void signInMenuDisplay()
{
  // BG
  noStroke();
  fill(#464646);
  rectMode(CORNER);
  rect(0, 0, width, height);
  // Title
  textSize(60);
  textAlign(CENTER, CENTER);
  fill(255);
  text(signUpMenu == 0 ? "SIGN IN" : "SIGN UP", width / 2, 140);
  rect(250, 200, width - 500, 400);
  fill(#27B8FF);
  rect(250, 200, width / 2 - 250, 10);
  fill(#B302E5);
  rect(width / 2, 200, width / 2 - 250, 10);
}
void signInMenuInput()
{
  if(signUpMenu == 1)
    username += key;
  //if confirm go to next
  //signUpMenu++;
  else if (signUpMenu == 2)
    password+=key;
}
void advanced(){
   
}
