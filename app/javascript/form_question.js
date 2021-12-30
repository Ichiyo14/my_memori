import { createApp } from 'vue'
import App from './form_question.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-form-question';
  if (document.querySelector(selector)) {
    createApp(App).mount(selector);
  }
})
