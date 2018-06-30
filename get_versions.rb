require 'rest-client'
require 'json'

def get_versions()
  api_url = 'https://api.github.com/repos/NixOS/nix/tags'
  JSON.parse(RestClient.get api_url || []).map {|r| r["name"] }
end

vers = get_versions
File.write("./versions.txt", vers.reverse.join("\n")) if vers.length > 0
