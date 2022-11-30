// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import { initSortable } from "./plugins/init_sortable"
initSortable();
