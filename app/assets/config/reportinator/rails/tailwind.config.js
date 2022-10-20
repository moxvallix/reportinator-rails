module.exports = {
  content: [
    '/home/moxvallix/Projects/amorc/statement-printer/reports/reportinator-rails/app/views/**/*.*',
'/home/moxvallix/Projects/amorc/statement-printer/reports/reportinator-rails/app/components/**/*.*',
'/home/moxvallix/Projects/amorc/statement-printer/reports/reportinator-rails/app/helpers/**/*.*',
'/home/moxvallix/Projects/amorc/statement-printer/reports/reportinator-rails/app/assets/javascripts/**/*.js',
'/home/moxvallix/Projects/amorc/statement-printer/reports/reportinator-rails/app/**/application.tailwind.css'
  ],
  plugins: [
    require('@tailwindcss/forms'),
	require('@tailwindcss/aspect-ratio'),
	require('@tailwindcss/typography')
  ]
}