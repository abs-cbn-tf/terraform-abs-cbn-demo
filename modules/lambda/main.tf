data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function_payload.zip"
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.handler
  memory_size   = var.memory

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.runtime

  environment {
    variables = var.env_var
  }

  tags = var.my_lambda_tags
}

# resource "aws_lambda_permission" "lambda_permission" {
#   statement_id  = "AllowMyDemoAPIInvoke"
#   action        = "lambda:InvokeFunction"
#   function_name = "MyDemoFunction"
#   principal     = "apigateway.amazonaws.com"

#   # The /* part allows invocation from any stage, method and resource path
#   # within API Gateway.
#   # source_arn = "${aws_api_gateway_rest_api.MyDemoAPI.execution_arn}/*"

# }
