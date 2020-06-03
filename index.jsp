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
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    .el-header,
    .el-footer {
      background-color: white;
      color:#409EFF;
      text-align: center;
      line-height: 60px;
    }

    .el-aside {
      background-color: #D3DCE6;
      color: #333;
      text-align: center;
      line-height: 200px;
    }

    .el-main {
      background-color: #E9EEF3;
      color: #333;
      text-align: center;
      line-height: 160px;
    }

    body>.el-container {
      margin-bottom: 40px;
    }

    .el-container:nth-child(5) .el-aside,
    .el-container:nth-child(6) .el-aside {
      line-height: 260px;
    }

    .el-container:nth-child(7) .el-aside {
      line-height: 320px;
    }

    .el-carousel__item h3 {
      color: #475669;
      font-size: 18px;
      opacity: 0.75;
      line-height: 300px;
      margin: 0;
    }

    .el-carousel__item:nth-child(3) {
      background-color: saddlebrown;
    }

    .el-carousel__item:nth-child(4) {
      background-color: #409EFF;
    }

    .el-carousel__item:nth-child(5) {
      background-color: black;
    }

    .el-carousel__item:nth-child(6) {
      background-color: bisque;
    }

    a {
      text-decoration: none;
    }

    .time {
      font-size: 13px;
      color: #999;
    }

    .bottom {
      margin-top: 13px;
      line-height: 12px;
    }

    .button {
      margin-left: 10px;
      float: right;
    }

    .image {
      width: 100%;
      display: block;
    }

    .clearfix:before,
    .clearfix:after {
      display: table;
      content: "";
    }

    .clearfix:after {
      clear: both
    }
    .block{
      height: 90px;
      background-image: url(https://img.alicdn.com/tfs/TB1OaEjIhD1gK0jSZFsXXbldVXa-1190-70.png);
      background-repeat: no-repeat;
      background-size:100%,100%;
    }
  </style>
</head>

<body>
<%--    <%--%>
<%--      String username1=(String)session.getAttribute("userName1");--%>
<%--      if(username1==null){--%>
<%--        request.setCharacterEncoding("UTF-8");--%>
<%--        String username=request.getParameter("userName");--%>
<%--        if(username==null){--%>
<%--          response.sendRedirect("login.jsp");--%>
<%--        }else{--%>
<%--          session.setAttribute("userName1",username);--%>
<%--          out.println(username+"欢迎您来到主页面，请选择您要购买的东西：");--%>
<%--        }--%>
<%--      }else{--%>
<%--        out.println(username1+"欢迎您来到主页面，请选择您要购买的东西：");--%>
<%--      }--%>
<%--    %>--%>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.13.2/lib/index.js"></script>
<div id="app">
  <el-container>
    <el-header>
      <el-link href="login.jsp" :underline="false">登录</el-link>
      <el-link href="register2.jsp" :underline="false">注册</el-link>
      <el-link href="box.jsp" :underline="false">购物车</el-link>
    </el-header>
    <el-main style="padding: 0;">
      <template>
        <el-carousel height="400px">
          <el-carousel-item v-for="item in 4" :key="item">
            <h3>{{ item }}</h3>
          </el-carousel-item>
        </el-carousel>
      </template>
    </el-main>
  </el-container>

  <el-container>
    <el-header>
      <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
        <el-menu-item index="1">个人中心</el-menu-item>
        <el-submenu index="2">
          <template slot="title">商品种类</template>
          <el-menu-item index="2-1">食品</el-menu-item>
          <el-menu-item index="2-2">数码</el-menu-item>
          <el-menu-item index="2-3">运动</el-menu-item>
          <el-submenu index="2-4">
            <template slot="title">服装</template>
            <el-menu-item index="2-4-1">男装</el-menu-item>
            <el-menu-item index="2-4-2">女装</el-menu-item>
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
    <el-footer>Footer</el-footer>
  </el-container>

  <el-container>
    <el-aside width="200px">Aside</el-aside>
    <el-main>
      <el-row>
        <el-col :span="5" v-for="(o, index) in 4" :key="o" :offset="index > 0 ? 1 : 0">
          <el-card :body-style="{ padding: '0px'}" shadow="hover">
            <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                 class="image">
            <div style="padding: 14px;">
              <div class="bottom clearfix">
                <p style="margin-bottom: 30px;">好吃的汉堡</p>
                <el-button type="primary" class="button" @click="test">加入购物车</el-button>
                <el-button type="primary" class="button" @click="test">购买</el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>

    </el-main>
  </el-container>

  <el-container>
    <el-header>Header</el-header>
    <el-container>
      <el-aside width="200px">Aside</el-aside>
      <el-main>
        <el-row>
          <el-col :span="5" v-for="(o, index) in 4" :key="o" :offset="index > 0 ? 1 : 0">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                   class="image">
              <div style="padding: 14px;">
                <div class="bottom clearfix">
                  <p style="margin-bottom: 30px;">好吃的汉堡</p>
                  <el-button type="primary" class="button">加入购物车</el-button>
                  <el-button type="primary" class="button">购买</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </el-container>

  <el-container>
    <el-header>Header</el-header>
    <el-container>
      <el-aside width="200px">Aside</el-aside>
      <el-container>
        <el-main>
          <el-row>
            <el-col :span="5" v-for="(o, index) in 4" :key="o" :offset="index > 0 ? 1 : 0">
              <el-card :body-style="{ padding: '0px'}" shadow="hover">
                <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                     class="image">
                <div style="padding: 14px;">
                  <div class="bottom clearfix">
                    <p style="margin-bottom: 30px;">好吃的汉堡</p>
                    <el-button type="primary" class="button">加入购物车</el-button>
                    <el-button type="primary" class="button">购买</el-button>
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
    <el-aside width="200px">Aside</el-aside>
    <el-container>
      <el-header>Header</el-header>
      <el-main>
        <el-row>
          <el-col :span="5" v-for="(o, index) in 4" :key="o" :offset="index > 0 ? 1 : 0">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                   class="image">
              <div style="padding: 14px;">
                <div class="bottom clearfix">
                  <p style="margin-bottom: 30px;">好吃的汉堡</p>
                  <el-button type="primary" class="button">加入购物车</el-button>
                  <el-button type="primary" class="button">购买</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </el-container>

  <el-container>
    <el-aside width="200px">Aside</el-aside>
    <el-container>
      <el-header>Header</el-header>
      <el-main>
        <el-row>
          <el-col :span="5" v-for="(o, index) in 4" :key="o" :offset="index > 0 ? 1 : 0">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                   class="image">
              <div style="padding: 14px;">
                <div class="bottom clearfix">
                  <p style="margin-bottom: 30px;">好吃的汉堡</p>
                  <el-button type="primary" class="button">加入购物车</el-button>
                  <el-button type="primary" class="button">购买</el-button>
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
        activeIndex: '1',
        activeIndex2: '1',
        src: 'https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg',
        // currentDate: new Date()
      };
    },
    methods: {
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },
      test(){

      }
    }
  })
</script>
</body>

</html>