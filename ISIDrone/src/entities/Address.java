package entities;

public class Address {

    int id;
    String no;
    String street;
    String zip;
    String city;
    Province province;
    String telephone;

    // Constructeur
    public Address() {
        super();
    }

    public Address(int id, String no, String street, String zip,
                   String city, Province province, String telephone) {
        super();
        this.id = id;
        this.no = no;
        this.street = street;
        this.zip = zip;
        this.city = city;
        this.province = province;
        this.telephone = telephone;
    }


    // Getters | Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
