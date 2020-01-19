class Doctor implements Comparable<Doctor> {
  int ID;
  String name, phoneNumber, PHD, MINC;
  ArrayList<Client> allClients;
  public Doctor(int id, String n, String pN, String phd, String minc)
  {
    ID = id;
    name = n;
    phoneNumber = pN;
    PHD = phd;
    MINC = minc;
    allClients = new ArrayList<Client>();;
  }
  public int compareTo(Doctor c)
  {
    return c.name.compareTo(name);
  }
}
