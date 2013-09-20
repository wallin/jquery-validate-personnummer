'use strict'

describe 'jQuery plugin: jquery-validate-personnummer', ->

  validate = $.validator.methods['personnummer']

  it 'accepts a valid personnummer with a control digit', ->
    expect(validate('9001010017')).toBeTruthy()
    expect(validate('900101-0017')).toBeTruthy()
    expect(validate('100101+0014')).toBeTruthy()
    expect(validate('199001010017')).toBeTruthy()

  it 'rejects a valid personnummer without a control digit', ->
    expect(validate('900101001')).toBeFalsy()
    expect(validate('900101-001')).toBeFalsy()
    expect(validate('100101+001')).toBeFalsy()
    expect(validate('19900101001')).toBeFalsy()

  it 'rejects an invalid personnummer', ->
    expect(validate('112233-4455')).toBeFalsy()