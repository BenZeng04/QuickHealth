
void mainMenuDisplayDoctor()
{
  background(mainMenuBG[0]);
  fill(255);
  textFont(loadFont("ArialMT-48.vlw"));
  textAlign(LEFT, CENTER);
  textSize(64);
  text(thisDoctor.name, 460, 530);
  textSize(32);
  text("(Your ID is: " + thisDoctor.ID + ")", 360, 630);
}

void mainMenuDisplayPatient()
{
  background(mainMenuBG[1]);
  fill(255);
  textFont(loadFont("ArialMT-48.vlw"));
  textAlign(LEFT, CENTER);
  textSize(64);
  text(thisClient.name, 360, 530);
  textSize(32);
  text("(Your ID is: " + thisClient.ID + ")", 360, 630);
}

void mainMenuInput() // Make sure there are if statements for both patient and doctor
{
  if(mouseX >= 50 && mouseX <= 240 && mouseY >= 65 && mouseY <= 135) // check mouse is pressed and in right position
  {
    op = 3;
    editingDoctorData = false;
  }
  else if(mouseX >= 20 && mouseX <= 70 && mouseY >= 720 && mouseY <= 780)
    signOut();
  if(isClient)
  {
    if(mouseX >= 50 && mouseX <= 240 && mouseY >= 275 && mouseY <= 345)
    {
      op = 5;
    }
    else if(mouseX >= 50 && mouseX <= 240 && mouseY >= 150 && mouseY <= 230)
    {
      op = 6;
    }
  }
  else // Implement this
  {
    if(mouseX >= 50 && mouseX <= 240 && mouseY >= 175 && mouseY <= 245)
    {
      op = 4;
      patientSelected = -1;
      addingPatient = false;
      patientAddID = "";
    }
    // 4: List patients
  }
  // Make sure that when going to the patient listing screen, set patientSelected to -1.
}

private void signOut()
{
  op = 1;
  signedIn = false;
  signingIn = true;
  attemptedSignIn = false;
  signUpAsDoctor = false;
  inAdvancedScreen = false;
  advancedInfo = new String[]{"", ""};
  basicInfo = new String[]{"", ""};
  thisClient = null;
  thisDoctor = null;
  entryType = -1;
  saveStrings("Information.txt.", new String[]{"-1"});
}
