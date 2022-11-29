module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],

  theme: {
    extend: {
      colors: {
          'mirage': {
          '50': '#f4f4f4',
          '100': '#e8e9ea',
          '200': '#c6c7ca',
          '300': '#a3a6ab',
          '400': '#5f636b',
          '500': '#1a202c',
          '600': '#171d28',
          '700': '#141821',
          '800': '#10131a',
          '900': '#0d1016'
        }
      }
    }
  }
}
