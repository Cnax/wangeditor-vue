<template>
  <div class="home">
    <editor v-model="content" @onChange="editorChange"/>
  </div>
</template>

<script>
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
  },
  methods: {
    editorChange (html) {
      console.log('editorChange>>>', html)
    }
  }
}
</script>
