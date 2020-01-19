boolean editingDoctorData = false;

void yourDataDoctor()
{
  textFont(loadFont("GillSansMT-Bold-48.vlw"));
  background(yourDataBG[0]);
  fill(0);
  textSize(30);
  textAlign(LEFT, CENTER);
  text(thisDoctor.MINC, 650, 200);
  text(thisDoctor.phoneNumber, 650, 325);
  noStroke();
  rectMode(CORNER);
  if(editingDoctorData)
  rect(650, 340, 400, 3);
}
void yourDataPatient()
{
  textFont(loadFont("GillSansMT-Bold-48.vlw"));
  background(yourDataBG[1]);
  fill(0);
  textSize(30);
  textAlign(LEFT, CENTER);
  text(thisClient.healthCard, 650, 200);
  text(thisClient.phoneNumber, 650, 325);
  noStroke();
  rectMode(CORNER);
  if(editingDoctorData)
  rect(650, 340, 400, 3);
}
void yourDataMouseInput()
{
  if(mouseX >= 20 && mouseX <= 70 && mouseY >= 720 && mouseY <= 780)
    signOut();
  if(isClient)
  {
    if(dist(mouseX, mouseY, 1150, 325) <= 50)
      editingDoctorData = true;
    else
      editingDoctorData = false;
    if(mouseX >= 50 && mouseX <= 240 && mouseY >= 275 && mouseY <= 345)
      op = 5;
    else if(mouseX >= 50 && mouseX <= 240 && mouseY >= 150 && mouseY <= 230)
      op = 6;
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
    if(dist(mouseX, mouseY, 1150, 325) <= 50)
      editingDoctorData = true;
    else
      editingDoctorData = false;
    // 4: List patients
  }
}
void yourDataKeyInput()
{
  if(isClient)
  {
    if(editingDoctorData)
    {
      thisClient.phoneNumber = modString(key,thisClient.phoneNumber ,10,true,false);
      String[] database = loadStrings("Database.txt");
      database[thisClient.ID * DATA_COUNT + 5] = thisClient.phoneNumber;
      saveStrings("Database.txt", database);
    }
  }
  else
  {
    if(editingDoctorData)
    {
      thisDoctor.phoneNumber = modString(key,thisDoctor.phoneNumber ,10,true,false);
      String[] database = loadStrings("Database.txt");
      database[thisDoctor.ID * DATA_COUNT + 5] = thisDoctor.phoneNumber;
      saveStrings("Database.txt", database);
    }
  }
}
