<template>
  <div class="album-categories">
    <div class="category-container" v-for="(photoType, index) in photoTypeList" :key="index">
      <div class="category-card" :style="{ backgroundImage: `url(/api${photoType.mainPhoto})` }">
        <div class="card-content">
          <h3>{{ photoType.typeName }}</h3>
          <p>{{ photoType.phrase }}</p>
          <span class="photo-count">{{ photoType.photoCount }}张照片</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {getPhotoTypeList } from '@/apis/api/lifeTimeManage' // 假设添加了获取类型列表的 API
export default {
  name: 'LifeTime',
  data() {
    return {
      photoTypeList: [],
      currentPage: 1,
      pageSize: 20,
      total: 0,
    }
  },
  methods: {
    async getPhotoTypeList(isSearch = false) {
      if (isSearch) {
        this.currentPage = 1
      }
      this.loading = true
      let params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
        typeName: this.searchTypeName || undefined
      }
      try {
        const response = await getPhotoTypeList(params)
        if (response.code === 200) {
          this.photoTypeList = response.rows
          this.total = response.total
          console.log(this.photoTypeList)
        }
      } catch (error) {
        this.$message.error('获取照片类型列表失败')
      } finally {
        this.loading = false
      }
    },
  },
  mounted() {
    this.getPhotoTypeList();
  }
}
</script>

<style lang="less" scoped>
.album-categories {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  padding: 2rem;

  .category-container {
    transition: all 0.3s ease;

    &:hover .category-card {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);

      .card-content {
        opacity: 0;
        transform: translate(-50%, -50%);
      }
    }
  }

  .category-card {
    position: relative;
    height: 300px;
    border-radius: 15px;
    background-size: cover;
    background-position: center;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    cursor: pointer;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);

    &::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(
          to bottom,
          rgba(0, 0, 0, 0.4) 0%,
          rgba(0, 0, 0, 0.3) 100%
          
      );
      transition: all 0.4s ease;
    }

    &:hover::before {
      background: linear-gradient(
          to bottom,
          rgba(0, 0, 0, 0.2) 0%,
          rgba(0, 0, 0, 0.6) 100%
      );
    }
  }

  .card-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
    z-index: 2;
    opacity: 1;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    width: 80%;

    h3 {
      font-size: 1.8rem;
      margin-bottom: 0.5rem;
      font-weight: 600;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    p {
      font-size: 1rem;
      margin-bottom: 1rem;
      opacity: 0.9;
    }

    .photo-count {
      font-size: 0.9rem;
      opacity: 0.9;
      background: rgba(40, 40, 40, 0.9);
      padding: 0.3rem 0.8rem;
      border-radius: 20px;
      backdrop-filter: blur(5px);
      transition: all 0.3s ease;
      &:hover {
        background: rgba(255, 255, 255, 0.25);
      }
    }
  }
}
</style>
