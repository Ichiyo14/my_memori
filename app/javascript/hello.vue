<template lang="pug">
p {{ hello }}
div
  h2.title.is-2 'hoge'
</template>

<script>
export default {
  data() {
    return {
      hello: "Hello",
    };
  },
};
</script>

<style scoped></style>
