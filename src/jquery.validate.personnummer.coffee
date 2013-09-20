###*
jQuery validator plugin for Swedish SSN
https://github.com/wallin/jquery-validate-personnummer
###

luhn = (number) ->
  number = "#{number}"
  sum = 0
  for v, k in number.split('')
    v *= (2 - (k % 2))
    v -= 9 if v > 9
    sum += v
  Math.ceil(sum/10)*10 - sum


$.validator.addMethod("personnummer", (value, element) ->
  value = "#{value}"
  p = value.match /(18|19|20|21){0,1}(\d{2})(\d{2})(\d{2})([\-\+]{0,1})(\d{3})(\d{0,1})/
  return false unless p

  [year, month, day, divider, serial, control] = p[2..]
  cd = luhn "#{year}#{month}#{day}#{serial}"

  return cd is +control and !!control
, "Ogiltigt personnummer")

