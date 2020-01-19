int patientSelected = -1;
PImage indivPatientBG, listBG, dListBG;
/* List all patient screens */

void displayDoctors()
{
  background(dListBG);
  textFont(loadFont("GillSansMT-Bold-48.vlw"));
  
  textSize(50);
  textAlign(LEFT, CENTER);
  rectMode(CENTER);
  
  for(int i = 0; i < thisClient.allDoctors.size(); i++)
  {
    strokeWeight(4);
    stroke(0);
    fill(255);
    rect(720, 100 * i + 140, 600, 70);
    fill(0);
    text("Doctor #"+(i+1)+": " + thisClient.allDoctors.get(i).name, 440, 100 * i + 140);
  }
}
void displayTreatmentData()
{
    background(treatment);
    textFont(loadFont("GillSansMT-Bold-48.vlw"));
    textSize(60);
    fill(0);
    // Draw individual patient info
    textAlign(LEFT, CENTER);
    text(thisClient.name, 470, 120);
    String[] database = loadStrings("Database.txt");
    int ID = thisClient.ID;
    int start = ID * DATA_COUNT + 2;
    textSize(40);
    rectMode(CORNER);
    textAlign(LEFT, TOP);
    text(database[start + 5], 420, 300, 700, 400);
}

void displayTreatmentInput()
{
  if(mouseX >= 50 && mouseX <= 240 && mouseY >= 65 && mouseY <= 135) // check mouse is pressed and in right position
  {
    op = 3;
    editingDoctorData = false;
  }
  if(mouseX >= 50 && mouseX <= 240 && mouseY >= 275 && mouseY <= 345)
    {
      op = 5;
    }
  else if(mouseX >= 20 && mouseX <= 70 && mouseY >= 720 && mouseY <= 780)
    signOut();
}

void displayPatients()
{
  if(patientSelected == -1)
  {
    background(listBG);
    textFont(loadFont("GillSansMT-Bold-48.vlw"));
    
    textSize(50);
    textAlign(LEFT, CENTER);
    rectMode(CENTER);
    
    for(int i = 0; i < thisDoctor.allClients.size(); i++)
    {
      strokeWeight(4);
      stroke(0);
      fill(255);
      rect(720, 100 * i + 240, 600, 70);
      fill(0);
      text("View: " + thisDoctor.allClients.get(i).name, 440, 100 * i + 240);
    }
    
    if(addingPatient)
    {
      strokeWeight(3);
      fill(#E8E8E8, 190);
      rectMode(CENTER);
      if(addingPatient) stroke(#6A6B6C, 145); else noStroke();
      rect(720, 500, 400, 70, 5, 5, 5, 5);
  
      noStroke();
      fill(#F7CF00);
      rect(720, 600, 400, 70, 5, 5, 5, 5);
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(20);
      text("Confirm", 720, 600);
      
      fill(#9A9B9D);
      textSize(30);
      
      text(patientAddID.length() == 0? "Enter your ID...": patientAddID, 720, 500);
    }
  }
  else
  {
    background(indivPatientBG);
    textFont(loadFont("GillSansMT-Bold-48.vlw"));
    textSize(60);
    fill(0);
    // Draw individual patient info
    textAlign(LEFT, CENTER);
    text(thisDoctor.allClients.get(patientSelected).name, 470, 120);
    String[] database = loadStrings("Database.txt");
    int ID = thisDoctor.allClients.get(patientSelected).ID;
    int start = ID * DATA_COUNT + 2;
    textSize(40);
    rectMode(CORNER);
    textAlign(LEFT, TOP);
    text(database[start + 5], 420, 300, 700, 400);
  }
}

void displayPatientsMouse()
{
  if(patientSelected == -1)
  {
    for(int i = 0; i < thisDoctor.allClients.size(); i++)
    {
      if(mouseX >= 420 && mouseX <= 1020 && mouseY >= 100 * i + 205 && mouseY <= 100 * i + 275)
        patientSelected = i;
    }
    if(mouseX >= 380 && mouseX <= 1140 && mouseY >= 80 && mouseY <= 160)
    {
      addingPatient = true;
      patientAddID = "";
    }
    else if(mouseX >= 520 && mouseX <= 920 && mouseY >= 565 && mouseY <= 635)
    {
      addNewPatient(int(patientAddID));
      addingPatient = false;
    }
    else addingPatient = false;
  }
  if(mouseX >= 50 && mouseX <= 240 && mouseY >= 65 && mouseY <= 135) // check mouse is pressed and in right position
  {
    op = 3;
    editingDoctorData = false;
  }
  else if(mouseX >= 20 && mouseX <= 70 && mouseY >= 720 && mouseY <= 780)
    signOut();
}

void displayDoctorsMouse()
{
  if(mouseX >= 50 && mouseX <= 240 && mouseY >= 65 && mouseY <= 135) // check mouse is pressed and in right position
  {
    op = 3;
    editingDoctorData = false;
  }
  else if(mouseX >= 50 && mouseX <= 240 && mouseY >= 150 && mouseY <= 230)
  {
    op = 6;
  }
  else if(mouseX >= 20 && mouseX <= 70 && mouseY >= 720 && mouseY <= 780)
    signOut();
}

void displayPatientsKey()
{
  if(patientSelected == -1)
  {
    if(addingPatient)
    {
      patientAddID = modString(key, patientAddID, 7, true, false);
    }
    // Put nothing here
  }
  else
  {
    String[] database = loadStrings("Database.txt");
    int ID = thisDoctor.allClients.get(patientSelected).ID;
    int start = ID * DATA_COUNT + 2;
    if(database[start + 5].length() < 200 && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z') || (key >= '0' && key <= '9') || key == ' ' || key == '.' || key == ','))
      database[start + 5] += key;
    else if(key == BACKSPACE && database[start + 5].length() > 0)
      database[start + 5] = database[start + 5].substring(0, database[start + 5].length() - 1);
    saveStrings("Database.txt", database);
    // Let user edit patient data
  }
}
boolean addingPatient = false;
String patientAddID = "";

/* Unused for now */
private void addNewPatient(int patientID) // Will add to current doctor.
{
  // Modify Database (Only 1 integer)
  String[] database = loadStrings("Database.txt");
  int userInfoStart = thisDoctor.ID * DATA_COUNT + 2;
  if(patientID >= int(database[1])) return;
  if(database[patientID * DATA_COUNT + 2].split(" ")[1].equals("Doctor")) return;
  
  if(database[userInfoStart + 4].length() != 0)
  {
    if(database[userInfoStart + 4].charAt(0) >= '0' && database[userInfoStart + 4].charAt(0) <= '9')
    {
      int[] arr = int(database[userInfoStart + 4].split(" "));
      for(int i: arr) if(i == patientID) return;
    }
  }
  if(database[userInfoStart + 4].length() != 0)
    database[userInfoStart + 4] = join(str(sort(int(append(database[userInfoStart + 4].split(" "), patientID + "")))), " ");
  else database[userInfoStart + 4] = patientID + "";
  
  thisDoctor.allClients.clear();
  if(database[userInfoStart + 4].length() != 0)
  {
    int[] clientIDs = int(database[userInfoStart + 4].split(" "));
    if(clientIDs.length >= 1)
    {
      for(int i: clientIDs)
        thisDoctor.allClients.add(makeClient(database, i));
      Collections.sort(thisDoctor.allClients);
    }
  }
  
  userInfoStart = patientID * DATA_COUNT + 2;
  if(database[userInfoStart + 4].length() != 0)
    database[userInfoStart + 4] = join(str(sort(int(append(database[userInfoStart + 4].split(" "), thisDoctor.ID + "")))), " ");
  else database[userInfoStart + 4] = thisDoctor.ID + "";
  
  saveStrings("Database.txt", database);
  // Modify global varaible myDoctor
}
