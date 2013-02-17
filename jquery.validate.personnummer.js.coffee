###*
jQuery validator plugin for Swedish SSN
https://github.com/poptree/jquery-validate-personnummer

Copyright © 2012 Poptree AB

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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

