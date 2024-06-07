data "aws_lb" "this" {
  arn = "arn:aws:elasticloadbalancing:us-east-1:654654554686:loadbalancer/app/devops-na-nuvem-week/2678af2d20812371"
}

resource "aws_route53_record" "alb" {
  provider = aws.kenerry
  zone_id  = data.aws_route53_zone.this.zone_id
  name     = "devopsnanuvemweek.com"
  type     = "A"

  alias {
    name                   = data.aws_lb.this.dns_name
    zone_id                = data.aws_lb.this.zone_id
    evaluate_target_health = true
  }
}
