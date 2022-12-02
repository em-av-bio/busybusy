// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import { Application } from '@hotwired/stimulus'
import Dropdown from 'stimulus-dropdown'

const dropdown_application = Application.start()
dropdown_application.register('dropdown', Dropdown)