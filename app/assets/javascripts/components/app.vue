<template>
  <div class="root" v-bind:style="style">
    <slot />
  </div>
</template>

<script lang="ts">
import Vue, {ComponentOptions} from 'vue'

export interface App extends Vue {
  fontSize: string
  style(): {[key: string]: string}
}

export default {
  props: {
    fontSize: String
  },
  computed: {
    style() {
      return {
        fontSize: this.fontSize || '12px'
      }
    }
  }
} as ComponentOptions<App>
</script>

<style scoped>
.root {
  text-align: center;
}
</style>
