<template>
  <div class="field">
    <select>
      <option value="0">0</option>
      <option value="1">1</option>
    </select>
    <select>
      <option value="0">0</option>
      <option value="1">1</option>
    </select>
  </div>
  <p>{{ this.order }}</p>
</template>

<script>
export default {
  data() {
    return {
      scales: 1,
    };
  },
  methods: {},
};
</script>

<style scoped></style>
