require 'rubygems'
require 'hpricot'
require 'open-uri'

vorto = 'mondo'
dominio = 'http://www.reta-vortaro.de'

url = URI::escape("http://www.reta-vortaro.de/cgi-bin/sercxu.pl?sercxata=#{vorto}")
pagina1 = Hpricot(open(url))
url_palavra = pagina1.search('a[@target=precipa]').first.get_attribute('href')
url1 = dominio + url_palavra
pagina2 = Hpricot(open(url1))
definicao = pagina2.search('span[@class=dif]').first.to_s.gsub(Regexp.new('</?\w+((\s+\w+(\s*=\s*(?:".*?"|\'.*?\'|[^\'">\s]+))?)+\s*|\s*)/?>|\\n'), '')

puts definicao.strip.squeeze(' ')