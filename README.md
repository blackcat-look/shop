# shop
课程设计-网上购物平台
6.1
1.写完首页的商品页面，可以用到vue和element-ui
可以模仿淘宝页面
顶部：登录注册，个人中心，购物车
中间：商品信息，可以拉长页面，在右边设置导航按钮
底部：写一下其它信息
2.登陆注册页面，可以用之前完成的，要稍作修改
个人信息要加上邮箱或者电话

没有写完

6.2
1.完善首页
2.购物车页面
3.个人中心页面
4.个人信息页面，可以查看修改信息（数据库更新）
5.实现加入购物车和购买功能。
点击后如果没登录先去登录再来买，没有注册先去注册再登录再买
对url进行拦截， 当用户未登录的时候，跳转到登录界面。

6.3
看了一天的axios，还是不会写

6.4
终于把axios运行出来了

6.5
运用axios解决登陆注册的数据交互问题

6.7
将商品加入购物车，写一个Goods类，方便存商品的名字，价格和图片，放入session，购物车页面每次加载都要遍历一遍session，把里面的商品摆放出来。不同会员的购物车可以用会员id来区分，防止购物车混乱。
待解决：商品列表怎么写，实现点击对应商品就把对应商品的信息加入购物车

6.8
解决商品列表问题，解决购物车删除商品bug。
待解决：购物车图片的显示，首页aside边栏的内容，个人信息的修改

6.9
图片显示解决，个人信息修改解决

6.10
利用爬虫工具爬取京东商城数据，导入数据库，然后传到前端显示处理
