package util;

public class User {
    private String user_id;
    private String sex;
    private String address;
    private String telephone;
    private String password;

    public User() {}

    public User(String user_id, String password) {
        this.user_id=user_id;
        this.password=password;

    }

    public User(String user_id, String sex,String address,String telephone,String password) {

        this.user_id=user_id;
        this.sex=sex;
        this.address=address;
        this.telephone=telephone;
        this.password=password;

    }

    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

}
