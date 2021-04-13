const { environment } = require('@rails/webpacker')
// 追加
const webpack = require('webpack') 
 environment.plugins.append('Provide', 
   new webpack.ProvidePlugin({ 
     $: 'jquery', 
     jQuery: 'jquery'
   }) 
 )
module.exports = environment
