<%--
  Created by IntelliJ IDEA.
  User: 黑猫LOOK
  Date: 2020/6/2
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>首页</title>
  <!-- import CSS -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
  <link rel="stylesheet" href="css/index.css">
</head>
<body>

<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.13.2/lib/index.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.bootcss.com/qs/6.5.1/qs.min.js"></script>
<div id="app">
  <el-container>
    <el-header>
      <el-link href="login.jsp" :underline="false" >{{toLogin}}</el-link>
      <el-link href="register.jsp" :underline="false">{{toRegister}}</el-link>
      <el-link href="box.jsp" :underline="false">{{toBox}}</el-link>
      <el-link href="ExitServlet" :underline="false" >{{toExit}}</el-link>
    </el-header>
    <el-main style="padding: 5px;">
      <template>
        <el-carousel height="500px">
            <el-carousel-item >
              <img src="image/618-3.png" >
            </el-carousel-item>
            <el-carousel-item >
              <img src="image/狂欢.png" >
            </el-carousel-item>
            <el-carousel-item >
              <img src="image/汽车.jpg" >
            </el-carousel-item>
            <el-carousel-item >
              <img src="image/试卷.png" >
            </el-carousel-item>
        </el-carousel>
      </template>
    </el-main>
  </el-container>

  <el-container>
    <el-header>
      <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
        <el-menu-item index="1" >
          <el-link href="center.jsp" :underline="false" >个人中心</el-link>
        </el-menu-item>
        <el-submenu index="2">
          <template slot="title">商品种类</template>
          <el-menu-item index="2-1">
            <el-link @click="addgoods('食品')">食品</el-link>
          </el-menu-item>
          <el-menu-item index="2-2">
            <el-link @click="addgoods('数码')">数码</el-link>
          </el-menu-item>
          <el-menu-item index="2-3">
            <el-link @click="addgoods('运动')">运动</el-link>
          </el-menu-item>
          <el-submenu index="2-4">
            <template slot="title">服装</template>
            <el-menu-item index="2-4-1">
              <el-link @click="addgoods('T恤')">T恤</el-link>
            </el-menu-item>
            <el-menu-item index="2-4-2">
              <el-link @click="addgoods('裙子')">裙子</el-link>
            </el-menu-item>
          </el-submenu>
        </el-submenu>
        <el-menu-item index="3">新闻中心</el-menu-item>
        <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
      </el-menu>
      <div class="line"></div>
    </el-header>
    <el-main style="padding: 0;">
      <div class="demo-image__placeholder">
        <div class="block">

        </div>
      </div>
    </el-main>
    <el-footer>食品</el-footer>
  </el-container>

  <el-container>
    <el-main>
      <el-row>
        <el-col :span="5" v-for="item in list[0]" :key="item.id" :offset="1">
          <el-card :body-style="{ padding: '0px'}" shadow="hover">
            <img :src=item.image class="image">
            <div style="padding: 14px;">
              <div class="bottom clearfix">
                <p class="price">￥{{item.price}}</p>
                <div  class="goods_id">{{item.goods_id}}</div>
                <el-button type="primary" class="button" @click="addBox(0,item.id)">加入购物车</el-button>
                <el-button type="primary" class="button" @click="addBox(0,item.id)">购买</el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </el-main>
  </el-container>

  <el-container>
    <el-header>数码</el-header>
    <el-container>
      <el-main>
        <el-row>
          <el-col :span="5" v-for="item in list[1]" :key="item.goods_id" :offset="1">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <img :src=item.image class="image">
              <div style="padding: 14px;">
                <div class="bottom clearfix">
                  <p class="price">￥{{item.price}}</p>
                  <p style="margin-bottom: 30px;">{{item.goods_id}}</p>
                  <el-button type="primary" class="button" @click="addBox(1,item.id)">加入购物车</el-button>
                  <el-button type="primary" class="button" @click="addBox(1,item.id)">购买</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </el-container>

  <el-container>
    <el-header>时尚</el-header>
    <el-container>
      <el-container>
        <el-main>
          <el-row>
            <el-col :span="5" v-for="item in list[2]" :key="item.goods_id" :offset="1">
              <el-card :body-style="{ padding: '0px'}" shadow="hover">
                <img :src=item.image class="image">
                <div style="padding: 14px;">
                  <div class="bottom clearfix">
                    <p class="price">￥{{item.price}}</p>
                    <p style="margin-bottom: 30px;">{{item.goods_id}}</p>
                    <el-button type="primary" class="button" @click="addBox(2,item.id)">加入购物车</el-button>
                    <el-button type="primary" class="button" @click="addBox(2,item.id)">购买</el-button>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </el-main>

      </el-container>
    </el-container>
  </el-container>

  <el-container>
    <el-container>
      <el-header>Header</el-header>
      <el-main>
        <el-row>
          <el-col :span="5" v-for="item in list[3]" :key="item.goods_id" :offset="1">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <img :src=item.image class="image">
              <div style="padding: 14px;">
                <div class="bottom clearfix">
                  <p class="price">￥{{item.price}}</p>
                  <p style="margin-bottom: 30px;">{{item.goods_id}}</p>
                  <el-button type="primary" class="button" @click="addBox(3,item.id)">加入购物车</el-button>
                  <el-button type="primary" class="button" @click="addBox(3,item.id)">购买</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </el-container>

  <el-container>
    <el-container>
      <el-header>Header</el-header>
      <el-main>
        <el-row>
          <el-col :span="5" v-for="item in list[4]" :key="item.goods_id" :offset="1">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <img :src=item.image class="image">
              <div style="padding: 14px;">
                <div class="bottom clearfix">
                  <p class="price">￥{{item.price}}</p>
                  <p style="margin-bottom: 30px;">{{item.goods_id}}</p>
                  <el-button type="primary" class="button" @click="addBox(4,item.id)">加入购物车</el-button>
                  <el-button type="primary" class="button" @click="addBox(4,item.id)">购买</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-main>
      <el-footer>Footer</el-footer>
    </el-container>
  </el-container>
  <template>
    <el-backtop></el-backtop>
  </template>
</div>
<script>
  new Vue({
    el: '#app',
    data(){
      return {
        toLogin:'登录',
        toRegister:'注册',
        toBox:'购物车',
        toExit:'退出',
        activeIndex: '1',
        activeIndex2: '1',
        list:[
          [
          { id:1,goods_id: '香辣鸡腿堡',price:'16',image:"https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"},
          { id:2,goods_id: '西冷牛排',price:'59',image:"image/牛排.png"},
          { id:3,goods_id: '麻辣小龙虾',price:'78',image:"image/小龙虾.png"},
          { id:4,goods_id: '舌尖剁椒',price:'29',image:"image/辣椒.png"}
        ],
          [
          { id:1,goods_id: '金属超薄笔记本',price:'3999',image:"image/电脑.png"},
          { id:2,goods_id: '简约头戴式耳机',price:'299',image:"image/耳机.png"},
          { id:3,goods_id: '高端蓝牙耳机',price:'589',image:"image/蓝牙耳机.png"},
          { id:4,goods_id: 'iphone20',price:'458',image:"image/手机.png"}
        ],
          [
          {id:1,goods_id: '清新风帽子',price:'69.8',image:"image/帽子.png"},
          {id:2,goods_id: '真皮时尚小方包',price:'599',image:"image/提包.png"},
          {id:3,goods_id: '防摔耐磨行李箱',price:'178',image:"image/箱子.png"},
          {id:4,goods_id: '简约时尚双肩包',price:'89',image:"image/书包.png"}
        ],
          [
          {id:1,goods_id: '医疗健康口罩',price:'20',image:"image/口罩.png"},
          {id:2,goods_id: '呼呼2',price:'2',image:"image/手机.png"},
          {id:3,goods_id: '呼呼3',price:'3',image:"image/手机.png"},
          {id:4,goods_id: '呼呼4',price:'4',image:"image/手机.png"}
        ],
          [
          {id:1,goods_id: '咚咚1',price:'1',image:"image/口罩.png"},
          {id:2,goods_id: '咚咚2',price:'2',image:"image/口罩.png"},
          {id:3,goods_id: '咚咚3',price:'3',image:"image/口罩.png"},
          {id:4,goods_id: '咚咚4',price:'4',image:"image/口罩.png"}
        ]
      ]
      };
    },
    methods: {
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },
      loginid(){
        let that=this;
        axios({
          method: 'post',
          url:'GoodsServlet',
          headers: {'content-type': 'application/x-www-form-urlencoded'},
        }).then(function (response) {
          if(response.data.flag==true) {
            console.log(response.data);
            // console.log(that.toLogin);
            that.toLogin = response.data.user_id;
            // console.log(that.toLogin);

          }
        }).catch(function (error) {
          console.log(error);
        })
      },
      addBox(num1,num2){
        let postData;
           postData = Qs.stringify({
            goods_id: this.list[num1][num2-1].goods_id,
            price: this.list[num1][num2-1].price,
            image: this.list[num1][num2-1].image,
          });
        console.log(postData);
          axios({
            method:'post',
            url:'GoodsServlet',
            headers: {'content-type': 'application/x-www-form-urlencoded'},
            data: postData
          }).then(function (response) {
              if(response.data.flag==false){
                  location.href="login.jsp";
              }else{
                alert('购买成功')
              }
          }).catch(function (error) {
              console.log(error);
          })
      },
      addgoods(species){
        let postData;
        postData = Qs.stringify({
          species:species
        });
        let that = this;
        let x=0,y=0;
        axios({
          method:'post',
          url:'getGoodsServlet',
          headers: {'content-type': 'application/x-www-form-urlencoded'},
          data: postData
        }).then(function (response) {
          let goodsArray = new Array();
          goodsArray = response.data.goods;
          console.log(goodsArray);
          for(let i in goodsArray){
            that.list[x][y].goods_id=goodsArray[i].goods_id;
            that.list[x][y].image=goodsArray[i].image;
            that.list[x][y].price=goodsArray[i].price;
            y++;
            console.log(x,y);
            if(y==4){
              y=0;x++;
            }
            if(x==5)break;
          }
        }).catch(function (error) {
          console.log(error);
        })
      }
    },
    mounted(){
      this.loginid();
      this.addgoods('T恤');
    }
  })
</script>
</body>

</html>