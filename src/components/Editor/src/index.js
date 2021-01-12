import wangeditor from './Wangeditor'
/* istanbul ignore next */
wangeditor.install = function (Vue) {
  Vue.component(wangeditor.name.toLowerCase(), wangeditor)
}

export default wangeditor
