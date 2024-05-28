package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Product> items;
    private static Cart instance;

    public Cart() {
        items = new ArrayList<>();
    }
    /**
     * Sequence diagram: AddCart - CNPM
     * 1.1.4: add(Product) (is sent by AddToCartServlet)
     */
    public void add(Product p) {
        for (Product item : items) {
            if (p.getId() == item.getId()) {
                item.setNumber(item.getNumber() + 1);
                return;
            }
        }
        items.add(p);
    }
    /**
     * Sequence diagram: UpdateQuantity - CNPM
     * 2.1.2: 1.add(Product, pQuantity) (is sent by AddToCartServlet)
     */
    public void add(Product p, int quantity) {
        for (Product item : items) {
            if (p.getId() == item.getId()) {
                item.setNumber(quantity);
                return;
            }
        }
        items.add(p);
    }
    /**
     * Sequence diagram: UpdateQuantity - CNPM
     * 2.1.3: 1.remove(Product) (is sent by AddToCartServlet)
     */
    /**
     * Sequence diagram: RemoveItem - CNPM
     * 2.1.8: remove(Product) (is sent by AddToCartServlet)
     */
    public void remove(Product p) {
        for (Product item : items) {
            if (p.getId() == item.getId()) {
                items.remove(item);
                return;
            }
        }
    }

    public List<Product> getItems() {
        return items;
    }

    public void setItems(List<Product> items) {
        this.items = items;
    }

    public double getTotalAmount() {
        double amount = 0;
        for (Product item : items) {
            amount += item.getNumber() * item.getPrice();
        }
        return Math.round(amount * 100.0) / 100.0;
    }

    /**
     * Sequence diagram: AddCart - CNPM
     * 1.1.3: getInstance() (is sent by AddToCartServlet)
     */
    public static Cart getInstance() {
        if(instance==null) instance = new Cart();
        return instance;
    }
}