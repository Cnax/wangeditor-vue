<template>
  <div class="home">
    <editor v-model="content"/>
  </div>
</template>

<script>
// @ is an alias to /src
import Editor from '@/components/Editor/src'

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
