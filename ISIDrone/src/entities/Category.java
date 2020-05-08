package entities;

public class Category implements Comparable<Category> {
    private int id;
    private String name,
            description;
    private int order;
    private Boolean isActive;

    public Category() {
    }

    public Category(int id, String name, String description, int order, Boolean isActive) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.order = order;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public boolean isActive() {
        return isActive;
    }

    @Override
    public int compareTo(Category o) {
        return (Integer.compare(this.getOrder(), o.getOrder()));
    }
}
