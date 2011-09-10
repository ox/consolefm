Gem::Specification.new do |s|
  s.name = "consolefm"
  s.summary = "Grab track info from any genre on console.fm"
  s.description = "A gem that communicates with console.fm and returns information on all the popular songs on the site for any sub-genre of electronic music"

  s.version = '0.1'
  s.author = 'Artem Titoulenko'
  s.email = 'artem.titoulenko@gmail.com'
  s.homepage = 'https://github.com/ArtemTitoulenko/consolefm'

  s.files        = Dir["lib/**/*"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.has_rdoc = false
end
