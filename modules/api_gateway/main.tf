--resource "aws_api_gateway" "this" {
    description = "API Gateway"
    name = var.api_gateway_name
}

resource "aws_api_gateway_rest_api" "api" {
  name        = "api_gateway"
  description = "API Gateway for Lambda"
}

resource "aws_api_gateway_resource" "this" {
    parent_id = aws_api_gateway.this.root_resource_id
    path_part = "my-resource"
    rest_api_id = aws_api_gateway.this.id
}


resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "POST"
  authorization = "NONE"
}

--resource "aws_api_gateway_integration" "this" {
    http_method = aws_api_gateway_method.this.http_method
    integration_http_method = "POST"
    resource_id = aws_api_gateway_resource.this.id
    rest_api_id = aws_api_gateway.this.id
    type = "LAMBDA"
    uri = "arn:aws:apigateway:${aws_region}:lambda:path/2015-03-31/functions/${aws_lambda_function.this.arn}/invocations"
}


resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.db_function.function_name
  principal     = "apigateway.amazonaws.com"
}
