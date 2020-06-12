<%--
  Created by IntelliJ IDEA.
  User: 黑猫LOOK
  Date: 2020/6/10
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/center.css">
</head>

<body>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.13.2/lib/index.js"></script>
<div id="app">
    <el-header>
        个人中心
    </el-header>
    <el-container style=" border: 1px solid #eee">
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
            <el-menu :default-openeds="['1','2', '3']">
                <el-submenu index="1">
                    <template slot="title"><i class="el-icon-message"></i>个人信息</template>
                    <el-menu-item-group>
                        <el-menu-item index="1-1" >
                            <el-link href="#" :underline="false" >查看信息</el-link>
                        </el-menu-item>
                        <el-menu-item index="1-2" >
                            <el-link href="changePass.jsp" :underline="false" >修改信息</el-link>
                        </el-menu-item>
                        <el-menu-item index="1-3" >
                            <el-link href="changePass.jsp" :underline="false" >修改密码</el-link>
                        </el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="2">
                    <template slot="title"><i class="el-icon-menu"></i>已购买商品</template>
                    <el-menu-item-group>
                        <el-menu-item index="2-1">全部订单</el-menu-item>
                        <el-menu-item index="2-2">待收货</el-menu-item>
                        <el-menu-item index="2-3">待评价</el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="3">
                    <template slot="title"><i class="el-icon-setting"></i>客户服务</template>
                    <el-menu-item-group>
                        <el-menu-item index="3-1">返修退换货</el-menu-item>
                        <el-menu-item index="3-2">我的发票</el-menu-item>
                        <el-menu-item index="3-3">购买咨询</el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
            </el-menu>
        </el-aside>
        <el-calendar v-model="value">
        </el-calendar>

</div>

<script>
    new Vue({
        el: '#app',
        data() {
            return {
                activeIndex: '1',
                activeIndex2: '1',
                value: new Date()
            };
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },

        }
    })
</script>
</body>

</html>