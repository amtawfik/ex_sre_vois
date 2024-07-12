resource "aws_api_gateway" "apigw" {
    description = "API Gateway"
    name = var.api_gateway_name
}

resource "aws_api_gateway_resource" "apigw-res" {
    parent_id = aws_api_gateway.apigw.root_resource_id
    path_part = "my-resource"
    rest_api_id = aws_api_gateway.apigw.id
}

resource "aws_api_gateway_method" "apigw-method" {
    authorization = "NONE"
    http_method = "GET"
    resource_id = aws_api_gateway_resource.apigw-res.id
    rest_api_id = aws_api_gateway.apigw.id
}

resource "aws_api_gateway_integration" "this" {
    http_method = aws_api_gateway_method.apigw-method.http_method
    integration_http_method = "POST"
    resource_id = aws_api_gateway_resource.apigw-res.id
    rest_api_id = aws_api_gateway.apigw.id
    type = "LAMBDA"
    uri = "arn:aws:apigateway:${aws_region}:lambda:path/2015-03-31/functions/${module.lambda.lambda-arn}/invocations"
}
