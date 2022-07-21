resource "aws_redshift_cluster" "test_cluster" {
  cluster_identifier = "reposcan-test"
  database_name      = "mydb"
  master_username    = "exampleuser"
  master_password    = "Mustbe8characters"
  node_type          = "ds2.xlarge"
  cluster_type       = "single-node"

  publicly_accessible = true
  skip_final_snapshot = true
}
