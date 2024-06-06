data "aws_route53_zone" "this" {
  name     = "devopsnanuvemweek.com"
  provider = aws.kenerry
}
