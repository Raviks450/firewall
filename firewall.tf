# Create a firewall rule to allow web traffic (HTTP and HTTPS)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-web-traffic"
  network = google_compute_network.vpc_network.name
  
  description = "Allows TCP ports 80 and 443 from all sources for web servers"
  direction   = "INGRESS"

  # Define the allowed protocols and ports
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # Specify the source of the traffic (any IP in this case)
  source_ranges = ["0.0.0.0/0"]

  # Target instances with the 'web-server' network tag
  target_tags = ["web"]

  # Enable logging (optional, but recommended for operational advantages)
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

# Create a firewall rule to allow web traffic (HTTP and HTTPS)
resource "google_compute_firewall" "allow_https" {
  name    = "allow-web-traffic"
  network = google_compute_network.vpc_network.name
  
  description = "Allows TCP ports 80 and 443 from all sources for web servers"
  direction   = "INGRESS"

  # Define the allowed protocols and ports
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  # Specify the source of the traffic (any IP in this case)
  source_ranges = ["0.0.0.0/0"]

  # Target instances with the 'web-server' network tag
  target_tags = ["database"]

  # Enable logging (optional, but recommended for operational advantages)
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}
