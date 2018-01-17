'use strict'

const ora = require('ora')
const rm = require('rimraf')
const path = require('path')
const config = require('../config')

const spinner = ora('cleaning...')
spinner.start()

rm(path.join(config.build.assetsRoot), err => {
  if (err) throw err
})
