resource "aws_api_gateway" "this" {
    description = "API Gateway"
    name = var.api_gateway_name
}

resource "aws_api_gateway_resource" "this" {
    parent_id = aws_api_gateway.this.root_resource_id
    path_part = "my-resource"
    rest_api_id = aws_api_gateway.this.id
}

resource "aws_api_gateway_method" "this" {
    authorization = "NONE"
    http_method = "GET"
    resource_id = aws_api_gateway_resource.this.id
    rest_api_id = aws_api_gateway.this.id
}

resource "aws_api_gateway_integration" "this" {
    http_method = aws_api_gateway_method.this.http_method
    integration_http_method = "POST"
    resource_id = aws_api_gateway_resource.this.id
    rest_api_id = aws_api_gateway.this.id
    type = "LAMBDA"
    uri = "arn:aws:apigateway:${aws_region}:lambda:path/2015-03-31/functions/${aws_lambda_function.this.arn}/invocations"
}
