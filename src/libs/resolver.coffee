evalWithContext = require '@testx/eval'

module.exports = (ctx) ->
  (variable) ->
    resolveOne = (v) ->
      if v
        switch typeof v
          when 'string'
            if m = v.match(/(\{\{(.+?)\}\})/) or v.match(/(\$\{(.+?)\})/)
              [full, withCurlies, varname] = m
              result = evalWithContext ctx, varname
              result = if typeof result is 'function'
                result ctx
              else
                resolveOne result
              if withCurlies is v
                resolveOne result
              else
                resolveOne v.replace withCurlies, result
            else v
          when 'object'
            if Array.isArray v
              resolveOne val for val in v
            else
              result = {}
              for key, val of v
                result[resolveOne key] = resolveOne val
              result
          else v
      else v

    resolveOne variable
