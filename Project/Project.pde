/*
StarterHacks Project
1/18/2020
Ben Zeng, Oscar Han, Ronald You, Brian Kang, (Matthew Li)
main menu
*/
import java.util.*;
final int CLICK_DELAY = 50;
final int DATA_COUNT = 7;
private int timeSinceLastClick = 0;
int op; 
/*
0: splash screen
1: sign up
2: main menu
3: display user data
4: list doctors
5: view specific client info
*/
boolean isClient;
boolean signedIn;
PImage[] mainMenuBG = new PImage[2], yourDataBG = new PImage[2];
PImage treatment;
Client thisClient = null;
Doctor thisDoctor = null;

/* Main Methods */
void setup() {
  size(1200, 800);
  mainMenuBG[0] = loadImage("menuDoctor.png");
  mainMenuBG[0].resize(width, height);
  mainMenuBG[1] = loadImage("menuPatient.png");
  mainMenuBG[1].resize(width, height);
  yourDataBG[0] = loadImage("yourDataDoctor.png");
  yourDataBG[0].resize(width, height);
  yourDataBG[1] = loadImage("yourDataPatient.png");
  yourDataBG[1].resize(width, height);
  
  listBG = loadImage("patientlistDoctor.png");
  listBG.resize(width, height);
  
  dListBG = loadImage("doctorList.png");
  dListBG.resize(width, height);
  indivPatientBG = loadImage("patientlistDoctor2.png");
  indivPatientBG.resize(width, height);
  
  treatment = loadImage("treatmentPatient.png");
  treatment.resize(width, height);
  
  // Setup of user
  String[] info = loadStrings("Information.txt");
  String[] dataBase = loadStrings("Database.txt");
  int userID = int(info[0].split(" ")[0]);
  if(userID == -1) 
  {
    signedIn = false;
    op = 1;
  }
  else
  {
    op = 2;
    signedIn = true;
    int userInfoStart = userID * DATA_COUNT + 2;
    isClient = dataBase[userInfoStart].split(" ")[1].equals("Client");
    
    if(isClient)
    {
      thisClient = makeClient(dataBase, userID);
      if(dataBase[userInfoStart + 4].length() != 0)
      {
        if(dataBase[userInfoStart + 4].charAt(0) >= '0' && dataBase[userInfoStart + 4].charAt(0) <= '9')
        {
          int[] doctorIDs = int(dataBase[userInfoStart + 4].split(" "));
          if(doctorIDs.length >= 1)
          {
            for(int i: doctorIDs)
              thisClient.allDoctors.add(makeDoctor(dataBase, i));
            Collections.sort(thisClient.allDoctors);
          }
        }
      }
    }
    else
    {
      thisDoctor = makeDoctor(dataBase, userID);
      if(dataBase[userInfoStart + 4].length() != 0)
      {
        if(dataBase[userInfoStart + 4].charAt(0) >= '0' && dataBase[userInfoStart + 4].charAt(0) <= '9')
        {
          int[] clientIDs = int(dataBase[userInfoStart + 4].split(" "));
          if(clientIDs.length >= 1)
          {
            for(int i: clientIDs)
              thisDoctor.allClients.add(makeClient(dataBase, i));
            Collections.sort(thisDoctor.allClients);
          }
        }
      }
    }
  }
}

void draw()
{
  timeSinceLastClick++;
  if(op == 1) 
    signInMenuDisplay();
  else if(op == 2)
  {
    if(isClient)
      mainMenuDisplayPatient();
    else
      mainMenuDisplayDoctor();
  }
  else if(op == 3)
  {
    if(isClient)
      yourDataPatient();
    else
      yourDataDoctor();
  }
  else if(op == 4) 
    displayPatients();
  else if(op == 5)
    displayDoctors();
  else if(op == 6)
    displayTreatmentData();
}
void mousePressed()
{
  if(timeSinceLastClick < CLICK_DELAY)
  {
    if(op == 1)
      signInMenuInput();
    else if(op == 2)
      mainMenuInput();
    else if(op == 3)
      yourDataMouseInput();
    else if(op == 4)
      displayPatientsMouse();
    else if(op == 5)
      displayDoctorsMouse();
    else if(op == 6)
      displayTreatmentInput();
    // put shit here
  }
  timeSinceLastClick = 0;
}
void keyPressed()
{
  if(op == 1)
    signInMenuKeyInput();
  else if(op == 3)
    yourDataKeyInput();
  else if(op == 4)
    displayPatientsKey();
}
void addNewClient(Client c, String password)
{
  String[] dataBase = loadStrings("Database.txt");
  int count = int(dataBase[1].split(" ") [0]);
  String[] newClientData = new String[DATA_COUNT];
  c.ID = count;
  dataBase[1] = (count + 1) + "";
  newClientData[0] = count + " Client";
  newClientData[1] = c.name;
  newClientData[2] = c.healthCard;
  newClientData[3] = c.phoneNumber;
  newClientData[4] = "";
  newClientData[5] = "";
  newClientData[6] = password;
  thisClient = c;
  signedIn = true;
  isClient = true;
  saveStrings("Information.txt", new String[]{count + ""});
  saveStrings("Database.txt", concat(dataBase, newClientData));
}
void addNewDoctor(Doctor d, String password)
{
  String[] dataBase = loadStrings("Database.txt");
  int count = int(dataBase[1].split(" ") [0]);
  String[] newDoctorData = new String[DATA_COUNT];
  d.ID = count;
  dataBase[1] = (count + 1) + "";
  newDoctorData[0] = count + " Doctor";
  newDoctorData[1] = d.name;
  newDoctorData[2] = d.MINC;
  newDoctorData[3] = d.phoneNumber;
  newDoctorData[4] = "";
  newDoctorData[5] = "";
  newDoctorData[6] = password;
  thisDoctor = d;
  signedIn = true;
  isClient = false;
  saveStrings("Information.txt", new String[]{count + ""});
  saveStrings("Database.txt", concat(dataBase, newDoctorData));
}
Client makeClient(String[] dataBase, int ID)
{
  int userInfoStart = ID * DATA_COUNT + 2;
  return new Client(ID, dataBase[userInfoStart + 1], dataBase[userInfoStart + 2], dataBase[userInfoStart + 3]);
}
Doctor makeDoctor(String[] dataBase, int ID)
{
  int userInfoStart = ID * DATA_COUNT + 2;
  return new Doctor(ID, dataBase[userInfoStart + 1], dataBase[userInfoStart + 2], dataBase[userInfoStart + 3]);
}
