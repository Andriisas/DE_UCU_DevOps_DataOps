resource "google_bigquery_dataset" "demo" {
  project    = var.project_id
  dataset_id = var.bq_dataset_id
  location   = var.region
}

resource "google_bigquery_table" "simple" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.demo.dataset_id
  table_id   = var.bq_table_id

  deletion_protection = false

  schema = jsonencode([
    { name = "id", type = "INTEGER", mode = "REQUIRED" },
    { name = "name", type = "STRING", mode = "REQUIRED" },
    { name = "value", type = "INTEGER", mode = "REQUIRED" }
  ])
}

resource "google_bigquery_job" "seed_simple_table" {
  project  = var.project_id
  location = var.region
  job_id   = "seed-${var.bq_dataset_id}-${var.bq_table_id}-v1"

  query {
    query = <<-SQL
      INSERT INTO `${var.project_id}.${var.bq_dataset_id}.${var.bq_table_id}` (id, name, value)
      VALUES
        (1, 'alpha', 10),
        (2, 'beta', 20),
        (3, 'gamma', 30)
    SQL
    use_legacy_sql = false
  }

  depends_on = [google_bigquery_table.simple]
}
