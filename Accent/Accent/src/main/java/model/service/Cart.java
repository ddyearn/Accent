package model;

public class Cart {
    
    private int cart_id; //장바구니아이디
    private String member_id; //고객아이디
    private int product_id; //상품아이디
    private String name; //상품명
    private int price; //가격
    private int cnt; //수량
    
    public Cart() {}

    public Cart(String name, int price, int cnt, String member_id, int product_id) {
        super();
        this.name = name;
        this.price = price;
        this.cnt = cnt;
        this.member_id = member_id;
        this.product_id = product_id;
    }

    public int getCart_id() {
        return cart_id;
    }
    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }
    public String getMember_id() {
        return member_id;
    }
    public void setMember_id(String member_id) {
        this.member_id= member_id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public int getCnt() {
        return cnt;
    }
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
    
    @Override
    public String toString() {
        return "Cart [cart_id=" + cart_id + ", member_id=" + member_id+ ", name=" + name + ", product_id=" + product_id
                + ", price=" + price + ", cnt=" + cnt + "]";
    }
    
}
