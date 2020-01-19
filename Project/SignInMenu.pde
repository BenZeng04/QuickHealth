private String[] basicInfo = {"", ""};
private String[] advancedInfo = {"", ""};
private boolean inAdvancedScreen = false;
private boolean signUpAsDoctor = false;
private boolean attemptedSignIn = false;
private boolean signingIn = true;
private int entryType = -1;
// 5353
PImage background;

void signInMenuDisplay()
{
  textFont(loadFont("GillSansMT-Bold-48.vlw"));
  // BG
  noStroke();
  //background(background);
  fill(#002E89, 255);
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
    strokeWeight(3);
    fill(#E8E8E8, 190);
    rectMode(CENTER);
    if(entryType == 0) stroke(#6A6B6C, 145); else noStroke();
    rect(600, 300, 400, 70, 5, 5, 5, 5);
    if(entryType == 1) stroke(#6A6B6C, 145); else noStroke();
    rect(600, 400, 400, 70, 5, 5, 5, 5);
    
    noStroke();
    fill(#F7CF00);
    rect(600, 500, 400, 70, 5, 5, 5, 5);
    textSize(18);
    fill(#FCB500);
    text("Or... Create a new account", 600, 565);

    fill(255);
    textSize(20);
    text("SIGN IN", 600, 500);
    
    fill(#9A9B9D);
    textSize(30);
    text(basicInfo[0].length() == 0? "Enter your ID...": basicInfo[0], 600, 300);
    text(basicInfo[1].length() == 0? "Enter your password...": toAsterick(basicInfo[1]), 600, 400);
    
    if(attemptedSignIn)
    {
      fill(#D80202);
      textSize(18);
      text("Invalid ID or password.", 600, 240);
    }
  }
  else
  {
    if(!inAdvancedScreen)
    {
      strokeWeight(3);
      fill(#E8E8E8, 190);
      rectMode(CENTER);
      if(entryType == 0) stroke(#6A6B6C, 145); else noStroke();
      rect(600, 300, 400, 70, 5, 5, 5, 5);
      if(entryType == 1) stroke(#6A6B6C, 145); else noStroke();
      rect(600, 400, 400, 70, 5, 5, 5, 5);
      
      noStroke();
      fill(#F7CF00);
      rect(495, 500, 190, 70, 5, 5, 5, 5);
      rect(705, 500, 190, 70, 5, 5, 5, 5);
      textSize(18);
      fill(#FCB500);
      text("Or... Sign In", 600, 565);
  
      fill(255);
      textSize(16);
      text("I AM A DOCTOR", 495, 500);
      text("I AM A CLIENT", 705, 500);
      
      fill(#9A9B9D);
      textSize(30);
      text(basicInfo[0].length() == 0? "Enter your name...": basicInfo[0], 600, 300);
      text(basicInfo[1].length() == 0? "Enter your password...": toAsterick(basicInfo[1]), 600, 400);
      
      if(attemptedSignIn)
      {
        fill(#D80202);
        textSize(18);
        text("Invalid name or password.", 600, 240);
      }
    }
    else
    {
      strokeWeight(3);
      fill(#E8E8E8, 190);
      rectMode(CENTER);
      if(entryType == 0) stroke(#6A6B6C, 145); else noStroke();
      rect(600, 300, 400, 70, 5, 5, 5, 5);
      if(entryType == 1) stroke(#6A6B6C, 145); else noStroke();
      rect(600, 400, 400, 70, 5, 5, 5, 5);
      
      if(signUpAsDoctor)
      {
        fill(#9A9B9D);
        textSize(30);
        text(advancedInfo[0].length() == 0? "Enter your Medical #...": advancedInfo[0], 600, 300);
        text(advancedInfo[1].length() == 0? "Enter your Phone #...": advancedInfo[1], 600, 400);
      }
      else
      {
        fill(#9A9B9D);
        textSize(30);
        text(advancedInfo[0].length() == 0? "Enter your Health Card #...": advancedInfo[0], 600, 300);
        text(advancedInfo[1].length() == 0? "Enter your Phone #...": advancedInfo[1], 600, 400);
      }
      
      noStroke();
      fill(#F7CF00);
      rect(600, 500, 400, 70, 5, 5, 5, 5);
  
      fill(255);
      textSize(20);
      text("SIGN UP!", 600, 500);
    
      textSize(18);
      fill(#FCB500);
      text("Or... Sign In", 600, 565);
      if(attemptedSignIn)
      {
        fill(#D80202);
        textSize(18);
        text("Invalid data.", 600, 240);
      }
    }
  }
}


void signInMenuInput()
{
  entryType = -1;
  if(signingIn)
  {
    if(mouseX > 540 && mouseX < 660 && mouseY > 555 && mouseY < 575)
    {
      basicInfo = new String[]{"", ""};
      advancedInfo = new String[]{"", ""};
      inAdvancedScreen = false;
      attemptedSignIn = false;
      signingIn = false;
    }
    else if(mouseX > 400 && mouseX < 800 && mouseY > 265 && mouseY < 335)
      entryType = 0;
    else if(mouseX > 400 && mouseX < 800 && mouseY > 365 && mouseY < 435)
      entryType = 1;
    else if(mouseX > 400 && mouseX < 800 && mouseY > 465 && mouseY < 535)
    {
      attemptedSignIn = true;
      if(basicInfo[0].length() > 0 && basicInfo[1].length() > 0)
      {
        String[] dataBase = loadStrings("Database.txt");
        if(int(basicInfo[0]) < int(dataBase[1]))
        {
          int ID = int(basicInfo[0]);
          if(dataBase[DATA_COUNT * ID + 8].equals(basicInfo[1]))
          {
            op = 2;
            signedIn = true;
            saveStrings("Information.txt", new String[]{ID + ""});
            int userInfoStart = ID * DATA_COUNT + 2;
            isClient = dataBase[userInfoStart].split(" ")[1].equals("Client");
            
            if(isClient)
            {
              thisClient = makeClient(dataBase, ID);
              if(dataBase[userInfoStart + 4].length() != 0)
              {
                if(dataBase[userInfoStart + 4].charAt(0) >= '0' && dataBase[userInfoStart + 4].charAt(0) <= '9')
                {
                  int[] doctorIDs = int(dataBase[userInfoStart + 4].split(" "));
                  for(int i: doctorIDs)
                    thisClient.allDoctors.add(makeDoctor(dataBase, i));
                  Collections.sort(thisClient.allDoctors);
                }
              }
            }
            else
            {
              thisDoctor = makeDoctor(dataBase, ID);
              if(dataBase[userInfoStart + 4].length() != 0)
              {
                if(dataBase[userInfoStart + 4].charAt(0) >= '0' && dataBase[userInfoStart + 4].charAt(0) <= '9')
                {
                  int[] clientIDs = int(dataBase[userInfoStart + 4].split(" "));
                  for(int i: clientIDs)
                    thisDoctor.allClients.add(makeClient(dataBase, i));
                  Collections.sort(thisDoctor.allClients);
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    if(mouseX > 540 && mouseX < 660 && mouseY > 555 && mouseY < 575)
    {
      basicInfo = new String[]{"", ""};
      advancedInfo = new String[]{"", ""};
      inAdvancedScreen = false;
      attemptedSignIn = false;
      signingIn = true;
    }
    if(!inAdvancedScreen)
    {
      if(mouseX > 400 && mouseX < 800 && mouseY > 265 && mouseY < 335)
        entryType = 0;
      else if(mouseX > 400 && mouseX < 800 && mouseY > 365 && mouseY < 435)
        entryType = 1;
      else if(mouseX > 400 && mouseX < 590 && mouseY > 465 && mouseY < 535) // Doctor
      {
        attemptedSignIn = true;
        if(basicInfo[0].length() > 0 && basicInfo[1].length() > 0)
        {
          advancedInfo = new String[]{"", ""};
          attemptedSignIn = false;
          signUpAsDoctor = true;
          inAdvancedScreen = true;
        }
      }
      else if(mouseX > 610 && mouseX < 800 && mouseY > 465 && mouseY < 535) // Client
      {
        attemptedSignIn = true;
        if(basicInfo[0].length() > 0 && basicInfo[1].length() > 0)
        {
          advancedInfo = new String[]{"", ""};
          attemptedSignIn = false;
          signUpAsDoctor = false;
          inAdvancedScreen = true;
        }
      }
    }
    else
    {
      if(mouseX > 400 && mouseX < 800 && mouseY > 265 && mouseY < 335)
        entryType = 0;
      else if(mouseX > 400 && mouseX < 800 && mouseY > 365 && mouseY < 435)
        entryType = 1;
      else if(mouseX > 400 && mouseX < 800 && mouseY > 465 && mouseY < 535)
      {
        attemptedSignIn = true;
        if(advancedInfo[0].length() == (signUpAsDoctor? 6: 10) && advancedInfo[1].length() == 10)
        {
          if(signUpAsDoctor)
            addNewDoctor(new Doctor(-1, basicInfo[0], advancedInfo[0], advancedInfo[1]), basicInfo[1]);
          else
            addNewClient(new Client(-1, basicInfo[0], advancedInfo[0], advancedInfo[1]), basicInfo[1]);
          op = 2;
          signedIn = true;
        }
      }
    }
  }
}
void signInMenuKeyInput()
{
  if(entryType == -1) return;
  if(signingIn)
  {
    if(entryType == 0)
      basicInfo[entryType] = modString(key, basicInfo[entryType], 7, true, false);
    else
      basicInfo[entryType] = modString(key, basicInfo[entryType], 15, true, true);
  }
  else
  {
    if(!inAdvancedScreen)
    {
      if(entryType == 0)
        basicInfo[entryType] = modString(key, basicInfo[entryType], 10, false, true);
      else
        basicInfo[entryType] = modString(key, basicInfo[entryType], 15, true, true);
    }
    else
    {
      if(entryType == 0)
        advancedInfo[entryType] = modString(key, advancedInfo[entryType], signUpAsDoctor? 6: 10, true, false);
      else
        advancedInfo[entryType] = modString(key, advancedInfo[entryType], 10, true, false);
    }
  }
}
String toAsterick(String s)
{
  String ret = "";
  for(int i = 0; i < s.length(); i++)
    ret += "*";
  return ret;
}
String modString(char c, String s, int limit, boolean numeric, boolean alpha)
{
  if(s.length() != 0 && c == BACKSPACE)
    s = s.substring(0, s.length() - 1);
  else if(numeric && s.length() < limit && (c >= '0' && c <= '9'))
      s += c;
  else if(alpha && s.length() < limit && ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')))
    s += c;
  return s;
}
