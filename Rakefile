# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"
require "open-uri"
require "json"

RuboCop::RakeTask.new

task default: :rubocop

def download_release_file(template_url)
  zip_path = "tmp/template.zip"
  FileUtils.rm_rf('tmp')
  FileUtils.mkdir_p('tmp')
  File.open(zip_path, "wb") do |saved_file|
    URI.open(template_url, "rb") do |read_file|
      saved_file.write(read_file.read)
    end
  end

  puts 'No zip to process. Exiting...' and exit unless File.exist?(zip_path)

  puts 'Unzipping...'
  FileUtils.rm_rf('tmp/dist')
  `unzip -d tmp/dist #{zip_path}`
end

def clean_existing_assets
  puts 'Cleaning old JS and CSS files...'

  `rm -rf vendor/assets/fonts`
  `rm -rf vendor/assets/javascripts`
  `rm -rf vendor/assets/stylesheets`

  FileUtils.mkdir_p('vendor/assets/fonts')
  FileUtils.mkdir_p('vendor/assets/javascripts/mazer')
  FileUtils.mkdir_p('vendor/assets/stylesheets/mazer')
end

def fix_fonts
  puts 'Fixing font URLs in SCSS files...'

  css_paths = [
    'vendor/assets/stylesheets/mazer/app.scss',
    'vendor/assets/stylesheets/mazer/app-dark.scss'
  ]

  # Replace : url(../../../assets/fonts/vendor/@fontsource/nunito/files/nunito-all-400-normal.woff?0c07f750f73ac5437580c0d0dff431ec)
  # With    : url(asset-path("vendor/@fontsource/nunito/files/nunito-all-400-normal.woff"))
  css_paths.each do |css_path|
    css_file = File.read(css_path)
    css_file = css_file.gsub(/url\((\.\.\/\.\.\/\.\.\/assets\/fonts\/)([^"?]+)(\?[\w]+)?\)/, 'url(asset-path("\2"))')
    File.open(css_path, "w") { |old_css_file| old_css_file.print css_file }
  end
end

def copy_assets
  clean_existing_assets

  puts 'Copying new JS and CSS files...'
  base_input_path = "tmp/dist/assets"
  base_output_path = "vendor/assets"
  `cp -R #{base_input_path}/fonts/* #{base_output_path}/fonts`
  `cp -R #{base_input_path}/js/*.js #{base_output_path}/javascripts/mazer`
  `cp -R #{base_input_path}/css/main/* #{base_output_path}/stylesheets/mazer`

  puts 'Renaming CSS files to SCSS...'
  `mv #{base_output_path}/stylesheets/mazer/app.css #{base_output_path}/stylesheets/mazer/app.scss`
  `mv #{base_output_path}/stylesheets/mazer/app-dark.css #{base_output_path}/stylesheets/mazer/app-dark.scss`

  fix_fonts
end

desc "Update assets"
task 'update' do
  release_url = 'https://api.github.com/repos/zuramai/mazer/releases/latest'
  release_data = JSON.parse(URI.open(release_url).read)
  template_url = release_data['assets'][0]['browser_download_url']

  download_release_file template_url
  copy_assets

  puts 'Finished!'
end