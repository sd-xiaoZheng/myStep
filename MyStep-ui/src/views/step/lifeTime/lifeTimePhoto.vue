<template>
  <div class="waterfall-album">
    <div class="masonry">
      <div v-for="(photo, idx) in photoList" :key="photo.id || idx" class="masonry-item">
        <div class="img-wrapper">
          <img :src="'/api' + photo.filePath" :alt="photo.name || '照片'" />
        </div>
      </div>
    </div>
    <div v-if="loading" class="loading">加载中...</div>
    <div v-if="!hasMore && photoList.length > 0" class="end">没有更多了~</div>
    <div v-if="!loading && photoList.length === 0" class="empty">暂无照片</div>
  </div>
</template>

<script>
import { getPhoto } from "@/apis/api/lifeTimePhoto";

export default {
  name: 'lifeTimePhoto',
  data() {
    return {
      currentPage: 1,
      pageSize: 20,
      total: 0,
      photoList: [],
      loading: false,
      hasMore: true,
      typeId: null
    }
  },
  mounted() {
    this.typeId = this.$route.query.id;
    this.getPhoto(this.typeId);
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    async getPhoto(id) {
      if (this.loading || !this.hasMore) return;
      this.loading = true;
      let params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
        typeId: id
      };
      getPhoto(params).then(res => {
        if (res.code === 200) {
          console.log('lifeTimePhoto页面收到的id:', res);
          this.photoList = [...this.photoList, ...res.rows];
          this.total = res.total;
          this.hasMore = this.photoList.length < this.total;
          if (this.hasMore) {
            this.currentPage++;
          }
        }
      }).finally(() => {
        this.loading = false;
      });

    },
    handleScroll() {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
      const windowHeight = window.innerHeight;
      const documentHeight = document.documentElement.scrollHeight;
      const scrollPercentage = (scrollTop + windowHeight) / documentHeight;
      if (scrollPercentage > 0.8 && !this.loading && this.hasMore) {
        this.getPhoto(this.typeId);
      }
    }
  }
}
</script>

<style scoped>
.waterfall-album {
  width: 100%;
  min-height: 60vh;
  padding: 2rem 0 3rem 0;
  background: linear-gradient(135deg, #f8fafc 0%, #e0e7ef 100%);
}
.masonry {
  column-count: 4;
  column-gap: 1.5rem;
  max-width: 1400px;
  margin: 0 auto;
}
@media (max-width: 1200px) {
  .masonry { column-count: 3; }
}
@media (max-width: 900px) {
  .masonry { column-count: 2; }
}
@media (max-width: 600px) {
  .masonry { column-count: 1; }
}
.masonry-item {
  break-inside: avoid;
  margin-bottom: 1.5rem;
  border-radius: 16px;
  box-shadow: 0 4px 16px rgba(0,0,0,0.08), 0 1.5px 4px rgba(0,0,0,0.04);
  background: #fff;
  overflow: hidden;
  transition: box-shadow 0.3s, transform 0.3s;
  cursor: pointer;
}
.masonry-item:hover {
  box-shadow: 0 8px 32px rgba(80,120,200,0.18), 0 2px 8px rgba(0,0,0,0.08);
  transform: translateY(-4px) scale(1.02);
}
.img-wrapper {
  width: 100%;
  background: #f3f6fa;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}
.img-wrapper img {
  width: 100%;
  height: auto;
  display: block;
  object-fit: contain;
  border-radius: 16px;
  transition: transform 0.3s;
}
.masonry-item:hover img {
  transform: scale(1.04);
}
.loading, .end, .empty {
  text-align: center;
  color: #888;
  font-size: 1.1rem;
  margin: 2rem 0 1rem 0;
}
</style>