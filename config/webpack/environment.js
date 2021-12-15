const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')

environment.plugins.prepend(
  'VueLoaderPlugin',
  new VueLoaderPlugin()
)

environment.loaders.prepend('vue', {
  test: /\.vue$/,
  use: [{
    loader: 'vue-loader'
  }]
})

environment.loaders.prepend('pug', {
  test: /\.pug$/,
  use: [{
    loader: 'pug-plain-loader'
  }]
})

module.exports = environment
