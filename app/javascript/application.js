// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import { initSortable } from "./plugins/init_sortable"
initSortable();
import "./channels"

// Popup code
const clickBtn = document.getElementById("clickBtn");
const popup = document.getElementById("popup");
const popupContainer = document.getElementById("popupContainer");
const closeBtn = document.getElementById("closeBtn");

clickBtn.addEventListener('click', () => {
  popupContainer.style.display = 'flex';
  popup.style.transform = 'translateY(0%)';
});
closeBtn.addEventListener('click', () => {
  popupContainer.style.display = 'none';
  popup.style.transform = 'translateY(100%)';
});