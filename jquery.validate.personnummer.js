/**
jQuery validator plugin for Swedish SSN
https://github.com/wallin/jquery-validate-personnummer
*/

var luhn;

luhn = function(number) {
  var k, sum, v, _i, _len, _ref;
  number = "" + number;
  sum = 0;
  _ref = number.split('');
  for (k = _i = 0, _len = _ref.length; _i < _len; k = ++_i) {
    v = _ref[k];
    v *= 2 - (k % 2);
    if (v > 9) {
      v -= 9;
    }
    sum += v;
  }
  return Math.ceil(sum / 10) * 10 - sum;
};

$.validator.addMethod("personnummer", function(value, element) {
  var cd, control, day, divider, month, p, serial, year, _ref;
  value = "" + value;
  p = value.match(/(18|19|20|21){0,1}(\d{2})(\d{2})(\d{2})([\-\+]{0,1})(\d{3})(\d{0,1})/);
  if (!p) {
    return false;
  }
  _ref = p.slice(2), year = _ref[0], month = _ref[1], day = _ref[2], divider = _ref[3], serial = _ref[4], control = _ref[5];
  cd = luhn("" + year + month + day + serial);
  return cd === +control && !!control;
}, "Ogiltigt personnummer");
