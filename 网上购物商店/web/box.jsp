<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: 黑猫LOOK
  Date: 2020/6/2
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <style>
        .el-header,
        .el-footer {
            background-color: #409EFF;
            color: white;
            text-align: center;
            line-height: 60px;
        }
    </style>
</head>

<body>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.13.2/lib/index.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.bootcss.com/qs/6.5.1/qs.min.js"></script>

<div id="app">
    <el-header>
        我的购物车
    </el-header>
    <el-table :data="list" border style="width: 100%;" v-show="list.length" highlight-current-row>
        <el-table-column label="复选框" width="100" style="color:red" :render-header="renderHeader">
            <template scope="scope">
                <el-checkbox v-model="scope.row.checked"></el-checkbox>
            </template>
        </el-table-column>
        <el-table-column prop="name" label="商品名称" width="180"></el-table-column>
        <el-table-column prop="image" label="商品图片" width="180">
            <template slot-scope="scope">
                <img :src="scope.row.image" alt="图片加载失败" style="height: 100px;width: 100px;">
            </template>
        </el-table-column>
        <el-table-column prop="price" label="商品单价" width="180">
            <template slot-scope="scope">
                <div>￥{{scope.row.price}}</div>
            </template>
        </el-table-column>
        <el-table-column label="商品数量" width="380">
            <template scope="scope">
                <el-input-number v-model="scope.row.num" controls-position="right" :min="1" :max="scope.row.number">
                </el-input-number>
            </template>
        </el-table-column>
        <el-table-column label="商品总价">
            <template scope="scope">
                <div>￥{{scope.row.price*scope.row.num}}</div>

            </template>
        </el-table-column>
        <el-table-column label="删除功能">
            <template scope="scope">
                <el-popover placement="top" width="160" v-model="scope.row.remove">
                    <p>亲！确定删除此商品吗？</p>
                    <div style="text-align: right; margin: 0">
                        <el-button size="mini" type="text" @click="scope.row.remove=false">取消</el-button>
                        <el-button type="primary" size="mini" @click="removeId(scope.row)">确定</el-button>
                    </div>
                    <el-button slot="reference">删除</el-button>
                </el-popover>

            </template>

        </el-table-column>
    </el-table>
    <div v-show="list.length==0" style="font-size:20px;color:red;display:none">商品全部为空</div>

    <el-footer>
        <div>合计：<span>{{countList}}</span></div>
        <el-popconfirm title="确定购买？">
            <el-button type="primary" slot="reference">结算</el-button>
        </el-popconfirm>
    </el-footer>

</div>
<style>
    .warning-row {
        background-color: aqua !important;
    }
</style>
<script>
    var vm = new Vue({
        el: "#app",
        data() {
            var checkAge = (rule, value, callback) => {
                if (!value) {
                    return callback(new Error('不能为空或者0'));
                }
                setTimeout(() => {
                    if (!Number.isInteger(value)) {
                        callback(new Error('请输入数字值'));
                    } else {
                        if (value < 0) {
                            callback(new Error('不能小于0'));
                        } else {
                            callback();
                        }
                    }
                }, 1000);
            };
            return {
                 list: [

                ],
                count: 0,
                istrue: false,
                ruleForm2: {
                    name: '',
                    price: '',
                    age: ''
                },
                rules2: {
                    age: [
                        { validator: checkAge, trigger: 'blur' }
                    ],
                    price: [
                        { validator: checkAge, trigger: 'blur' }
                    ]
                }

            }
        },
        computed: {
            countList: function () {
                var a = 0;
                for (let i = 0; i < this.list.length; i++) {
                    if (this.list[i].checked == true) {

                        a += this.list[i].price * this.list[i].num
                    }
                }
                this.count = a;
                return this.count
            }
        },
        watch: {
            istrue: function () {
                if (this.istrue == true) {
                    for (let k = 0; k < this.list.length; k++) {
                        this.list[k].checked = true;
                    }
                } else {
                    for (let k = 0; k < this.list.length; k++) {
                        this.list[k].checked = false;
                    }
                }

            }
        },
        methods: {
            removeId(value) {
                var names = value.name
                for (var i = 0; i < this.list.length; i++) {
                    if (names == this.list[i].name) {
                        let postData = Qs.stringify({
                           goods_id:this.list[i].name
                        });
                        axios({
                            method: 'post',
                            url:'DeleteServlet',
                            headers: {'content-type': 'application/x-www-form-urlencoded'},
                            data:postData
                        }).then(function (response) {
                            console.log(response);
                        }).catch(function (error) {
                            console.log(error);
                        })
                        this.list.splice(i, 1)
                    }
                }
            },
            renderHeader: function (h, params) {//实现table表头添加
                let self = this;
                return h('div', [
                    h('el-checkbox', {
                        on: {
                            change: (i) => {
                                self.istrue = i;
                            }
                        }
                    }, '全选')
                ]);

            },
            resetForm(formName) {
                this.$refs[formName].resetFields();//数据清空方法
            },
            getbox(){
                let that = this;
                let counts = 40;
                counts++;
                axios({
                    method:'get',
                    url:'BoxServlet',
                    headers: {'content-type': 'application/x-www-form-urlencoded'},
                }).then(function (response) {
                    console.log(response.data.box);
                    let boxarray = new Array();
                    boxarray = response.data.box;
                    for(i in boxarray)
                    {
                        that.list.push({
                            id: counts,
                            name: boxarray[i].goods_id,
                            image:boxarray[i].image,
                            price: boxarray[i].price,
                            number: 100,
                            checked: false,
                            num: 1,
                            remove: false
                        });
                        console.log(counts);
                    }
                }).catch(function (error) {
                    console.log(error);
                })
            }
        },
        mounted() {
            this.getbox();
        }
    })
</script>
</body>

</html>
