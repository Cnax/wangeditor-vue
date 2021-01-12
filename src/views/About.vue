<template>
  <div class="home">
    <editor v-model="content"/>
  </div>
</template>

<script>
import Editor from '@/components/Editor'

export default {
  name: 'Home',
  components: {
    Editor
  },
  data () {
    return {
      content: '123'
    }
  }
}
</script>
