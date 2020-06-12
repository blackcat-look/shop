<%--
  Created by IntelliJ IDEA.
  User: 黑猫LOOK
  Date: 2020/6/3
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <title>修改信息</title>
    <link rel="stylesheet" href="css/changePass.css">
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
                <span>欢迎注册</span>
            </div>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="昵称" prop="name">
                    不能修改
                </el-form-item>
                <el-form-item label="性别" prop="resource">
                    <el-radio-group v-model="ruleForm.resource">
                        <el-radio label="男"></el-radio>
                        <el-radio label="女"></el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="个人住址" prop="region">
                    <el-input v-model="ruleForm.region"></el-input>
                </el-form-item>
                <!-- <el-form-item label="即时配送" prop="delivery">
              <el-switch v-model="ruleForm.delivery"></el-switch>
            </el-form-item> -->
                <el-form-item label="原密码" prop="oldPass" >
                    <el-input type="oldPassword" v-model="ruleForm.oldPass" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="新密码" prop="pass" >
                    <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="确认新密码" prop="checkPass" >
                    <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item label="电话" prop="telephone" >
                    <el-input v-model="ruleForm.telephone"></el-input>
                </el-form-item>

                <el-form-item>

                    <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
            </el-form>
        </el-card>
    </el-main>
</div>

<script>
    new Vue({
        el: '#app',
        data() {
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.ruleForm.checkPass !== '') {
                        this.$refs.ruleForm.validateField('checkPass');
                    }
                    callback();
                }
            };
            var validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.ruleForm.pass) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            return {
                ruleForm: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: '',
                    pass: '',
                    checkPass: '',
                    telephone:'',
                 //   oldPass:'',
                },
                rules: {
                    name: [
                        { required: false, message: '请输入昵称', trigger: 'blur' },
                        { min: 1, max: 16, message: '长度在 1 到 16 个字符', trigger: 'blur' }
                    ],
                    region: [
                        { required: true, message: '请填写个人住址', trigger: 'change' }
                    ],
                    date1: [
                        { type: 'date', required: true, message: '请选择日期', trigger: 'change' }
                    ],
                    date2: [
                        { type: 'date', required: true, message: '请选择时间', trigger: 'change' }
                    ],
                    type: [
                        { type: 'array', required: false, message: '请至少选择一个活动性质', trigger: 'change' }
                    ],
                    resource: [
                        { required: true, message: '请选择活动资源', trigger: 'change' }
                    ],
                    desc: [
                        { required: true, message: '请填写活动形式', trigger: 'blur' }
                    ],
                    pass: [
                        { required: true,validator: validatePass, trigger: 'blur' }
                    ],
                    checkPass: [
                        { required: true,validator: validatePass2, trigger: 'blur' }
                    ],
                    telephone: [
                        { required:true, message: '请填写电话号码',trigger: 'blur'}
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let postData = Qs.stringify({
                            user_id:this.ruleForm.name,
                            sex:this.ruleForm.resource,
                            address:this.ruleForm.region,
                            telephone:this.ruleForm.telephone,
                            password:this.ruleForm.pass,
                        });
                        axios({
                            method:'post',
                            url:'ChangeServlet',
                            headers: {'content-type': 'application/x-www-form-urlencoded'},
                            data: postData
                        }).then(function (response) {
                            location.href="http://localhost:8080/_war_exploded/login.jsp";
                        }).catch(function (error) {
                            console.log(error);
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            }
        }
    })
</script>
</body>

</html>