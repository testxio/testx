module.exports = function(ctx, code) {
  result = '';
  with (ctx) {
    result = eval(code);
  }
  return result;
};
