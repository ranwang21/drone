package entities;

public class Order extends Cart {
    private static final long serialVersionUID = 1L;

    int id;
    int userId;
    User user;
    int qty;
    double price;
    String date;
    Boolean isShipped;

    public Order() {
        super();
    }

    public Order(int id, int userId, String date, Boolean isShipped) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.isShipped = isShipped;
    }

    public Order(int id, String date, Boolean isShipped, int qty, double price, User user) {
        this.id = id;
        this.date = date;
        this.qty = qty;
        this.price = price;
        this.isShipped = isShipped;
        this.user = user;
    }

    public int getQty() {
        return qty;
    }

    public double getPrice() {
        return price;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Boolean getShipped() {
        return isShipped;
    }

    public void setShipped(Boolean shipped) {
        isShipped = shipped;
    }
}
