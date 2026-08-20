resource "google_cloud_run_v2_service" "app" {
  name     = var.application_name
  location = var.region

  labels = {
    managed-by              = "cloudops"
    application             = lower(var.application_name)
    application-owner       = lower(var.application_owner)
    infrastructure-operator = "gisocc"
    environment             = lower(var.environment)
    platform                = "internal-developer-platform"
  }

  deletion_protection = false

  template {
    containers {
      image = var.container_image

      ports {
        container_port = 8080
      }
    }
  }
}