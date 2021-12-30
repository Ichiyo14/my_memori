<template>
  <div class="field">
    <p>質問の尺度を入力してください</p>
    <input type="number" min="0" max="1" v-model="first_scale" />
    <print>〜</print>
    <input type="number" min="1" max="99" v-model="last_scale" />
    <p>尺度名を入力してください</p>
    <p>(例:4 やや当てはまる)</p>
    <ul>
      <li v-for="(scale, index) in scales" :key="index">
        <label>尺度名</label>
        <p>{{ scales[index].scale }}</p>
        <input type="text" v-model="scales[index].representation" />
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      first_scale: 1,
      last_scale: 2,
      scales: [
        { scale: 1, representation: "尺度1" },
        { scale: 2, representation: "尺度2" },
      ],
    };
  },
  methods: {},
  watch: {
    first_scale: function (newFirstScale) {
      if (newFirstScale === 0) {
        for (let scale = 0; scale < this.last_scale + 1; scale++) {
          if (this.scales[scale] === undefined) {
            this.scales.push({
              scale: scale,
              representation: "尺度" + (scale + 1),
            });
          }
          this.scales[scale].scale = scale;
        }
      } else if (newFirstScale === 1) {
        for (let scale = 0; scale < this.last_scale; scale++) {
          if (this.scales[scale] === undefined) {
            this.scales.push({
              scale: scale,
              representation: "尺度" + scale,
            });
          }
          this.scales[scale].scale = scale + 1;
          if (this.scales[scale + 1]) {
            console.log(scale);
            this.scales.pop();
          }
        }
      }
    },
    last_scale: function (newLastScale, oldLastScale) {
      if (newLastScale > oldLastScale) {
        for (let time = 0; time < newLastScale - oldLastScale; time++) {
          if (this.first_scale === 0) {
            const addScaleNum = time + this.scales.length;
            this.scales.push({
              scale: addScaleNum,
              representation: "尺度" + addScaleNum,
            });
          } else if (this.first_scale === 1) {
            const addScaleNum = time + this.scales.length + 1;
            this.scales.push({
              scale: addScaleNum,
              representation: "尺度" + addScaleNum,
            });
          }
        }
      } else if (newLastScale < oldLastScale) {
        for (let time = 0; time < oldLastScale - newLastScale; time++) {
          this.scales.pop();
        }
      }
    },
  },
};
</script>

<style scoped></style>
