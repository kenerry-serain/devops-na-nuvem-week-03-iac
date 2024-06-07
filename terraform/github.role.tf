resource "aws_iam_role" "github" {
  name = "DevOpsNaNuvemWeekGitHubRole"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Effect = "Allow"
      Principal = {
        Federated : "arn:aws:iam::654654554686:oidc-provider/token.actions.githubusercontent.com"
      }
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" : "repo:kenerry-serain/devops-na-nuvem-week-03-apps:*"
        }
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_policy" "github" {
  name = "DevOpsNaNuvemWeekGitHubPolicy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:ecr:us-east-1:654654554686:repository/devops-na-nuvem-week/production/backend",
          "arn:aws:ecr:us-east-1:654654554686:repository/devops-na-nuvem-week/production/frontend",
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "github" {
  policy_arn = aws_iam_policy.github.arn
  role       = aws_iam_role.github.name
}
