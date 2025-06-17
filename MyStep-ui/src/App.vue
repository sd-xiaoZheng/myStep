<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>

export default {
  name: 'app',
  components: {
  }
}
</script>


<style>
/* 这样就不会出现左右的滚动条了 */
body {
  overflow-x: hidden; 
}
</style>
