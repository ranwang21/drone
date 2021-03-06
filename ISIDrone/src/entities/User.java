package entities;

public class User {
    int id;
    String lastName,
            firstName,
            email,
            password;
    int isAdmin;
    Address billAddress;
    Address shipAddress;
    String status;

    public User() {
    }

    public User(int id, String lastName, String firstName, String email,
                String password, int isAdmin, Address shipAddress, String status) {
        super();
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;
        this.password = password;
        this.shipAddress = shipAddress;
        this.isAdmin = isAdmin;
        this.status = status;
    }

    public User(int id, String lastName, String firstName, String email, String password, int isAdmin, Address billAddress, Address shipAddress, String status) {
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
        this.billAddress = billAddress;
        this.shipAddress = shipAddress;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public Address getBillAddress() {
        return billAddress;
    }

    public void setBillAddress(Address billAddress) {
        this.billAddress = billAddress;
    }

    public void setShipAddress(Address shipAddress) {
        this.shipAddress = shipAddress;
    }

    public Address getShipAddress() {
        return shipAddress;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public void setShipAdress(Address adress) {
        this.shipAddress = adress;
    }
}
