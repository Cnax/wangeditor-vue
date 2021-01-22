module.exports = {
  root: true,
  env: {
    node: true
  },
  extends: [
    'plugin:vue/essential',
    '@vue/standard'
  ],
  parserOptions: {
    parser: 'babel-eslint'
  },
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    // 箭头函数只有一个参数时，可以省略圆括号
    'arrow-parens': 0,
    // 关闭不必要的转义字符通知
    'no-useless-escape': 0,
    // debugger只在生产环境校验，本地开发可以使用，禁用这条规则
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
    // 禁用html属性必须换行的风格
    'vue/max-attributes-per-line': 0,
    // html空标签必须自闭合
    'vue/html-self-closing': 0,
    // 使用 === 替代 ==
    eqeqeq: ['error', 'always'],
    // 指定数组的元素之间要以空格隔开(,后面)， never参数：[ 之前和 ] 之后不能带空格，always参数：[ 之前和 ] 之后必须带空格
    'array-bracket-spacing': [2, 'never'],
    // 强制 function 定义中最多允许的参数数量
    'max-params': [1, 3],
    // 在大括号内强制保持一致的间距 eg: { name: 'aa', age: 3 }
    'object-curly-spacing': ['error', 'always'],
    quotes: [1, 'single'],
    semi: 0,
    'vue/component-name-in-template-casing': ['error', 'kebab-case', {
      registeredComponentsOnly: false,
      ignores: []
    }],
    'vue/name-property-casing': ['error', 'PascalCase'],
    'vue/order-in-components': ['error', {
      order: [
        'el',
        'name',
        'parent',
        'functional',
        ['delimiters', 'comments'],
        ['components', 'directives', 'filters'],
        'extends',
        'mixins',
        'inheritAttrs',
        'model',
        ['props', 'propsData'],
        'data',
        'computed',
        'watch',
        'LIFECYCLE_HOOKS',
        'methods',
        ['template', 'render'],
        'renderError'
      ]
    }],
    'vue/attributes-order': ['error', {
      order: [
        'DEFINITION',
        'LIST_RENDERING',
        'CONDITIONALS',
        'RENDER_MODIFIERS',
        'GLOBAL',
        'UNIQUE',
        'TWO_WAY_BINDING',
        'OTHER_DIRECTIVES',
        'OTHER_ATTR',
        'EVENTS',
        'CONTENT'
      ]
    }],
    'vue/max-attributes-per-line': ['error', {
      singleline: 3,
      multiline: {
        max: 1,
        allowFirstLine: false
      }
    }]
  }
}
