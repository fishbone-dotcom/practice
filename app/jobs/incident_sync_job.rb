require "net/http"
require "json"

class IncidentSyncJob < ApplicationJob
  queue_as :default

  def perform(organization_id)
    organization = Organization.find(organization_id)

    api_key = organization.api_key
    incidents = fetch_incidents(api_key)

    incidents.each do |payload|
      incident = Incident.find_or_initialize_by(
        external_id: payload["external_id"]
      )

      incident.assign_attributes(
        organization: organization,
        external_created_by_id: payload["external_created_by_id"],
        title: payload["title"],
        description: payload["description"],
        severity: payload["severity"],
        status: payload["status"],
        started_at: payload["started_at"],
        resolved_at: payload["resolved_at"]
      )

      incident.save!
    end
  end

  private

  def fetch_incidents(api_key)
    uri = URI("http://localhost:4567/incidents")

    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{api_key}"
    request["Accept"] = "application/json"

    response = Net::HTTP.start(
      uri.hostname,
      uri.port
    ) do |http|
      http.request(request)
    end

    JSON.parse(response.body)
  end
end