class UrlParser
  attr_reader :each, :scheme, :domain, :insecure_url

  def initialize(url)
    @new_url = url
  end

  #scheme attribute
  def scheme
    @new_scheme = @new_url.split(':').first

  end

  def domain
    @new_domain = @new_url.split('//')[1].split(':')[0]
  end

def port
scheme
  if @new_url.split('/')[2].include? ':'
    @port = @new_url.split("://")[1].split(":")[1].split("/")[0]
  elsif @new_scheme == "http"
    @port = "80"
  elsif @new_scheme == "https"
    @port = "443"
  end

end

def path
  if @new_url.split('/')[3].split('?')[0].empty?
    return NIL
  else
    return @new_url.split('/')[3].split('?')[0]
  end
end

def query_string
  final_hash = {}
  @new_url.split('?')[1].split('#')[0].split('?').first.split("&").each do |n|
  array1 = n.split("=")
  final_hash[array1.first] = array1.last
  end
  return final_hash

end

def fragment_id
  @fragment = @new_url.split('#')[1]
end

end

new_url = UrlParser.new("http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat")
@new_url = UrlParser.new ("https://www.google.com/?q=cat#img=FunnyCat")
insecure_url = UrlParser.new ("http://www.google.com/search")
