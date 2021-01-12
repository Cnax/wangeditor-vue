import Editor from './Editor'
/* istanbul ignore next */
Editor.install = function (Vue) {
  Vue.component(Editor.name, Editor)
}

export default Editor
