<template>
  <div class="shop">
    <h1>商品购买页面</h1>
    <el-row>
      <el-col v-for="item in items" :key="item.commodityCode" :span="8">
        <el-card :body-style="{ padding: '20px' }">
          <h3>{{ item.name }}</h3>
          <p>价格: {{ item.price }} 元</p>
          {{ edit_1 }} <!-- 添加数量选择 -->
          <el-input-number v-model="item.quantity" :min="1" label="数量"></el-input-number> <!-- 新增数量选择输入框 -->
          <el-button type="primary" @click="buyItem(item)">购买</el-button>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {purchase} from '@/apis/api/shop'

export default {
  name: "Shop",
  data() {
    return {
      items: [
        {commodityCode: "1A", name: "牛奶X2", price: 40, quantity: 1}, // 新增数量属性
        {commodityCode: "2B", name: "薯片X10", price: 50, quantity: 1}, // 新增数量属性
        {commodityCode: "3C", name: "可乐X8", price: 100, quantity: 1}, // 新增数量属性
      ]
    }
  },
  methods: {
    buyItem(item) { // 修改方法以使用商品的数量
      purchase(item).then((res) => {
        console.log(res)
      })
    }
  }
}
</script>

<style scoped>
.shop {
  padding: 20px;
}
</style>