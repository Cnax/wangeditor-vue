import wangeditor from './src'

const install = function (Vue) {
  if (install.installed) return
  install.installed = true
  Vue.component(wangeditor.name, wangeditor)
}

if (typeof window !== 'undefined' && window.Vue) {
  install(window.Vue)
}

export default wangeditor
export {
  install,
  wangeditor
}
