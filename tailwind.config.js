const defaultTheme = require('tailwindcss/defaultTheme')

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
        'great-blue': {
          DEFAULT: '#2A669F',
          '50': '#E4F7F8',
          '100': '#CCEEF2',
          '200': '#9CD7E5',
          '300': '#6CB9D8',
          '400': '#3B94CB',
          '500': '#2A669F',
          '600': '#234B83',
          '700': '#1B3366',
          '800': '#14204A',
          '900': '#0C102E'
        },
        'bg': '#FFF9F3',
        'focus': '#FF6D1B',
        'default': '#BBBBBB',
        'dark-alpha': 'rgba(0, 0, 0, .5)'
      },
      fontFamily: {
        'sans': ['futura-pt-condensed', ...defaultTheme.fontFamily.sans]
      }
    }
  }
}
