private String name = "";
private String ID = "";
private String password = "";
private boolean signingIn = true;
private int entryType = -1;
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
  text(signingIn? "SIGN IN" : "SIGN UP", width / 2, 140);
  rect(250, 200, width - 500, 400);
  fill(#27B8FF);
  rect(250, 200, width / 2 - 250, 10);
  fill(#B302E5);
  rect(width / 2, 200, width / 2 - 250, 10);
  
  if(signingIn)
  {
    
  }
}
void signInMenuInput()
{
  
}
void signInMenuKeyInput()
{
  if(entryType == -1) return;
  if(signingIn)
  {
  }
  else
  {
  }
}
void advanced(){

}
