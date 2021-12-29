import { createApp } from 'vue'
import App from './form_scale.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-form-scale';
  if (document.querySelector(selector)) {
    createApp(App).mount(selector);
  }
})
