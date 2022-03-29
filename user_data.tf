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
  }
}