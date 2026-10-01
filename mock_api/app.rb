require "sinatra"
require "json"

API_KEYS = {
  "key-org-a" => "ORG-A",
  "key-org-b" => "ORG-B"
}.freeze

set :host_authorization, {
  permitted_hosts: ["localhost", ".localhost", ".github.dev"]
}

get "/incidents" do
  content_type :json

  authorization = request.env["HTTP_AUTHORIZATION"]

  unless authorization&.start_with?("Bearer ")
    halt 401, { error: "Missing API key" }.to_json
  end

  api_key = authorization.delete_prefix("Bearer ")
  organization_id = API_KEYS[api_key]

  unless organization_id
    halt 401, { error: "Invalid API key" }.to_json
  end

  file = File.read(
    File.join(__dir__, "data", "incidents.json")
  )

  incidents = JSON.parse(file)

  incidents = incidents.select do |incident|
    incident["external_organization_id"] == organization_id
  end

  incidents.to_json
end