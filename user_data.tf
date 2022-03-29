data "archive_file" "nginx_lb" {
  type        = "zip"
  source_dir  = "${path.module}/${var.ansible_roles}/nginx_lb"
  output_path = "${path.module}/tmp/nginx_lb.zip"
}

data "template_file" "nginx_lb_init" {
  template = file("${path.module}/templates/init.sh.tmpl")
  vars = {
    role           = "nginx_lb"
    archive_base64 = filebase64(data.archive_file.nginx_lb.output_path)
    ansible_options = jsonencode({
      app_name        = "olya"
      web_servers     = [var.web_private_ip]
      web_server_port = 80
    })
  }
}

data "archive_file" "tomcat" {
  type        = "zip"
  source_dir  = "${path.module}/${var.ansible_roles}/tomcat"
  output_path = "${path.module}/tmp/tomcat.zip"
}

data "template_file" "tomcat_init" {
  template = file("${path.module}/templates/init.sh.tmpl")
  vars = {
    role           = "tomcat"
    archive_base64 = filebase64(data.archive_file.tomcat.output_path)
    ansible_options = jsonencode({
      app_name   = "olya"
      db_servers = [var.db_private_ip]
    })
  }
}

data "archive_file" "mongodb" {
  type        = "zip"
  source_dir  = "${path.module}/${var.ansible_roles}/mongodb"
  output_path = "${path.module}/tmp/mongodb.zip"
}

data "template_file" "mongodb_init" {
  template = file("${path.module}/templates/init.sh.tmpl")
  vars = {
    role            = "mongodb"
    archive_base64  = filebase64(data.archive_file.mongodb.output_path)
    ansible_options = jsonencode({})
  }
}