<template>
  <p>{{ message }}</p>
</template>

<script lang="ts">
interface Data {
  message: string
}

export default {
  data(): Data {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
