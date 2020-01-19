/*
StarterHacks Project
1/18/2020
Ben Zeng, Oscar Han, Ronald You, Brian Kang
main menu
*/
import java.util.*;
final int CLICK_DELAY = 50;
private int timeSinceLastClick = 0;
int op;
boolean isClient;
boolean signedIn;
Client thisClient = null;
Doctor thisDoctor = null;

/* Main Methods */
void setup() {
  size(1200, 800);
  textFont(loadFont("GillSansMT-Bold-48.vlw"));
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
    int userInfoStart = userID * 6 + 2;
    isClient = dataBase[userInfoStart].split(" ")[1].equals("Client");
    
    if(isClient)
    {
      thisClient = makeClient(dataBase, userID);
      int[] doctorIDs = int(dataBase[userInfoStart + 4].split(" "));
      for(int i: doctorIDs)
        thisClient.allDoctors.add(makeDoctor(dataBase, i));
      Collections.sort(thisClient.allDoctors);
    }
    else
    {
      thisDoctor = makeDoctor(dataBase, userID);
      int[] clientIDs = int(dataBase[userInfoStart + 5].split(" "));
      for(int i: clientIDs)
        thisDoctor.allClients.add(makeClient(dataBase, i));
      Collections.sort(thisDoctor.allClients);
    }
  }
}

void draw()
{
  timeSinceLastClick++;
  if(op == 1) 
    signInMenuDisplay();
}
void mousePressed()
{
  if(timeSinceLastClick < CLICK_DELAY)
  {
    //if(op == 1)
    //  signInMenuInput();
    // put shit here
  }
  timeSinceLastClick = 0;
}
void keyPressed()
{
  if(op == 1)
    signInMenuInput();
}
void addNewClient(Client c, String username, String password)
{
  String[] dataBase = loadStrings("Database.txt");
  int count = int(dataBase[1].split(" ") [0]);
  String[] newClientData = new String[6];
  c.ID = count;
  dataBase[1] = (count + 1) + "";
  newClientData[0] = count + " Client";
  newClientData[1] = c.name;
  newClientData[2] = c.healthCard;
  newClientData[3] = c.phoneNumber;
  newClientData[4] = "";
  newClientData[5] = "";
  thisClient = c;
  signedIn = true;
  isClient = true;
  saveStrings("Information.txt", new String[]{count + ""});
  saveStrings("Database.txt", concat(dataBase, newClientData));
}
void addNewDoctor(Doctor d, String username, String password)
{
  String[] dataBase = loadStrings("Database.txt");
  int count = int(dataBase[1].split(" ") [0]);
  String[] newDoctorData = new String[6];
  d.ID = count;
  dataBase[1] = (count + 1) + "";
  newDoctorData[0] = count + " Doctor";
  newDoctorData[1] = d.name;
  newDoctorData[2] = d.phoneNumber;
  newDoctorData[3] = d.PHD;
  newDoctorData[4] = d.MINC;
  newDoctorData[5] = "";
  thisDoctor = d;
  signedIn = true;
  isClient = false;
  saveStrings("Information.txt", new String[]{count + ""});
  saveStrings("Database.txt", concat(dataBase, newDoctorData));
}
Client makeClient(String[] dataBase, int ID)
{
  int userInfoStart = ID * 6 + 2;
  return new Client(ID, dataBase[userInfoStart + 1], dataBase[userInfoStart + 2], dataBase[userInfoStart + 3]);
}
Doctor makeDoctor(String[] dataBase, int ID)
{
  int userInfoStart = ID * 6 + 2;
  return new Doctor(ID, dataBase[userInfoStart + 1], dataBase[userInfoStart + 2], dataBase[userInfoStart + 3], dataBase[userInfoStart + 4]);
}
