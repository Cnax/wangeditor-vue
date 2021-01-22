import wangeditor from './Wangeditor'
/* istanbul ignore next */
wangeditor.install = function (Vue) {
  Vue.component(wangeditor.name, wangeditor)
}

export default wangeditor
