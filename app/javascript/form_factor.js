import { createApp } from 'vue'
import App from './form_factor.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-form-factor';
  if (document.querySelector(selector)) {
    createApp(App).mount(selector);
  }
})
