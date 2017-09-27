//= require ./lodash-by-compile

// 防止lodash模板与eruby冲突
// {%= %} {%- %} {% %}
_.templateSettings.escape = /{%-([\s\S]+?)%}/g
_.templateSettings.evaluate = /{%([\s\S]+?)%}/g
_.templateSettings.interpolate = /{%=([\s\S]+?)%}/g
