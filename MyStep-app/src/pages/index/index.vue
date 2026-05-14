<script lang="ts" setup>
defineOptions({
  name: 'Home',
})
definePage({
  // 使用 type: "home" 属性设置首页，其他页面不需要设置，默认为page
  type: 'home',
  style: {
    // 'custom' 表示开启自定义导航栏，默认 'default'
    navigationStyle: 'custom',
    navigationBarTitleText: '首页',
  },
})

// 定义方块选项
const menuItems = ref([
  { id: 1, title: '日记', icon: 'i-carbon-document', path: '/pages/diary/index' },
  { id: 2, title: '照片', icon: 'i-carbon-image', path: '/pages/photo/index' },
  { id: 3, title: '玩具', icon: 'i-carbon-game', path: '/pages/toy/index' },
  { id: 4, title: '留言墙', icon: 'i-carbon-chat', path: '/pages/message-wall/index' }
])

console.log('index/index 首页打印了')

onLoad(() => {
  console.log('测试 uni API 自动引入: onLoad')
})

// 处理方块点击事件
const handleItemClick = (item) => {
  console.log('点击了:', item.title)
  // 这里可以添加路由跳转逻辑
  uni.showToast({
    title: `点击了${item.title}`,
    icon: 'none'
  })
  // uni.navigateTo({ url: item.path })
}
</script>

<template>
  <view class="bg-gray-50 min-h-screen">
    <!-- 顶部标题 -->
    <view class="pt-safe pb-4 px-4 bg-white shadow-sm">
      <text class="text-xl font-bold text-gray-800">我的应用</text>
    </view>

    <!-- 方块网格布局 -->
    <view class="p-4">
      <view class="grid grid-cols-2 gap-4">
        <view 
          v-for="item in menuItems" 
          :key="item.id"
          class="bg-white rounded-lg p-6 flex flex-col items-center justify-center shadow-sm active:bg-gray-50 transition-colors"
          @click="handleItemClick(item)"
        >
          <!-- 图标 -->
          <view class="w-16 h-16 mb-3 flex items-center justify-center">
            <view :class="[item.icon, 'text-3xl text-blue-500']"></view>
          </view>
          <!-- 标题 -->
          <text class="text-base font-medium text-gray-700">{{ item.title }}</text>
        </view>
      </view>
    </view>
  </view>
</template>
