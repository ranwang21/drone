package entities;

public class Order extends Cart {
    private static final long serialVersionUID = 1L;

    int id;
    int userId;
    User user;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
