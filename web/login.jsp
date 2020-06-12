<%--
  Created by IntelliJ IDEA.
  User: 黑猫LOOK
  Date: 2020/6/2
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/login.css">
    <title>登录</title>
</head>

<body>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.13.2/lib/index.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.bootcss.com/qs/6.5.1/qs.min.js"></script>
<div id="app">
    <el-main>
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>欢迎登录</span>
            </div>
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="昵称">
                    <el-input v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="pass">
                    <el-input type="password" v-model="form.pass" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="onSubmit">登录</el-button>
                    <el-button  @click="register">注册</el-button>
                </el-form-item>
            </el-form>
        </el-card>
    </el-main>
</div>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                form: {
                    name: '',
                    pass: ''
                }
            }
        },
        methods: {
            onSubmit() {
                let postData = Qs.stringify({
                   user_id:this.form.name,
                    password:this.form.pass
                });
                axios({
                    method:'post',
                    url:'LoginServlet',
                    headers: {'content-type': 'application/x-www-form-urlencoded'},
                    data:postData
                }).then(function (response) {
                    if(response.data.flag==true){
                        location.href="http://localhost:8080/_war_exploded/index.jsp";
                    }else{
                        alert('昵称或者密码错误，请重新输入')
                    }
                    // location.href="http://localhost:8080/_war_exploded/index.jsp";
                }).catch(function (error) {
                    alert('昵称或者密码错误')
                })
            },
            register(){
                location.href="register.jsp";
            }
        }
    })
</script>
</body>

</html>