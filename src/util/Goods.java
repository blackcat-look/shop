package util;

public class Goods {
    private String goods_id;
    private String price;
    private String image;

    public Goods(){}

    public Goods(String goods_id,String price,String image){
        this.goods_id=goods_id;
        this.price = price;
        this.image = image;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPrice() {
        return price;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }
}
