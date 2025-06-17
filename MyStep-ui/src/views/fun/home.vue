<script>
export default {
  data() {
    return {
      videoSrc: ''
    };
  },
  mounted() {
    const videoFiles = require.context('../../assets/mp4/', false, /\.mp4$/).keys();
    const randomVideo = videoFiles[Math.floor(Math.random() * videoFiles.length)].split('/').pop();
    this.videoSrc = require(`../../assets/mp4/${randomVideo}`);
  }
}
</script>

<template>
  <div>
    <div class="video-container">
      <video autoplay loop muted>
        <source :src="videoSrc" type="video/mp4">
      </video>
    </div>
  </div>
</template>

<style scoped>
.video-container {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: hidden;
  z-index: 0;
}

.video-container video {
  width: 100%;
  height: auto;
  object-fit: cover;
}
</style>