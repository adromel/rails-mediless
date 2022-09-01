// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PosologyController from "./posology_controller"
application.register("posology", PosologyController)

import SearchInputController from "./search_input_controller"
application.register("search-input", SearchInputController)

import ThreejsController from "./threejs_controller"
application.register("threejs", ThreejsController)
