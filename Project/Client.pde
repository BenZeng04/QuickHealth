class Client implements Comparable<Client> {
  // Attributes
  int ID;
  String name, healthCard, phoneNumber;
  ArrayList<Doctor> allDoctors; // Will be null if doesn't exist
  public Client(int id, String n, String hc, String pn)
  {
    ID = id;
    name = n;
    healthCard = hc;
    phoneNumber = pn;
    allDoctors = new ArrayList<Doctor>();
  }
  public int compareTo(Client c)
  {
    return c.name.compareTo(name);
  }
}
