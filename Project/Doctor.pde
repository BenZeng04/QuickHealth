class Doctor implements Comparable<Doctor> {
  int ID;
  String name, MINC, phoneNumber;
  ArrayList<Client> allClients;
  public Doctor(int id, String n,  String minc, String pN)
  {
    ID = id;
    name = n;
    phoneNumber = pN;
    MINC = minc;
    allClients = new ArrayList<Client>();
  }
  public int compareTo(Doctor c)
  {
    return c.name.compareTo(name);
  }
}
