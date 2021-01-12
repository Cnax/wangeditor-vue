<template>
  <div ref="editor"></div>
</template>

<script>
import xss from 'xss'
import WangEditor from 'wangeditor'

export default {
  name: 'Wangeditor',
  props: {
    value: { type: String, default: '' },
    config: { type: Object, default: () => ({}) },
    disabled: { type: Boolean, default: false },
    openXss: { type: Boolean, default: true }
  },
  data () {
    return {
      editor: null,
      // 输入的时候锁定，禁止更新innerHTML
      isLocked: false
    }
  },
  computed: {
    content: {
      get () {
        return this.value
      },
      set (value) {
        this.$emit('input', value)
      }
    }
  },
  watch: {
    content: {
      handler (newVal, oldVal) {
        if (!this.isLocked) {
          this.editor.txt.html(newVal)
        }
      }
    },
    disabled: {
      immediate: true,
      handler (val) {
        if (this.editor && val) {
          this.editor.disable()
        }
      }
    }
  },
  mounted () {
    this.loadEditor()
    // 首次设置内容必须要在初始化结束
    this.editor.txt.html(this.value)
  },
  beforeDestroy () {
    // 销毁编辑器
    this.editor.destroy()
    this.editor = null
  },
  methods: {
    loadEditor () {
      const container = this.$refs.editor
      const editor = new WangEditor(container)

      this.editor = editor

      Object.keys(this.config).forEach(k => {
        editor.config[k] = this.config[k]
      })

      editor.config.onchange = (html) => {
        const newHtml = this.openXss ? xss(html) : html
        this.content = newHtml
        this.$emit('onChange', newHtml)
      }

      this.$nextTick(() => {
        const editorArea = document.getElementById(editor.textElemId)
        editorArea.oninput = () => {
          // 输入的时候设置为锁定状态，防止props变化引起的二次更新导致问题！！！
          this.isLocked = true
        }
      })

      editor.create()
    }
  }
}
</script>
