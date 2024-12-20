import base64
import boto3
import json
import random
import os

# Set up the AWS clients
bedrock_client = boto3.client("bedrock-runtime", region_name="us-east-1")
s3_client = boto3.client("s3")

# Retrieve environment variables (from template.yaml)
bucket_name = os.getenv("S3_BUCKET")


KANDIDATNUMMER = "82" # Mitt kanditatnummer

def lambda_handler(event, context):
    # Extract prompt from the incoming event body
    try:
        body = json.loads(event["body"])
        prompt = body.get("prompt", "Default prompt text if none provided")
    except (json.JSONDecodeError, KeyError):
        return {
            "statusCode": 400,
            "body": json.dumps({"message": "Invalid request body. 'prompt' field is required."})
        }

    # Generate a unique seed and S3 path for the image
    seed = random.randint(0, 2147483647)
    s3_image_path = f"{KANDIDATNUMMER}/generated_images/titan_{seed}.png"

    # Configure the request for the Titan model
    native_request = {
        "taskType": "TEXT_IMAGE",
        "textToImageParams": {"text": prompt},
        "imageGenerationConfig": {
            "numberOfImages": 1,
            "quality": "standard",
            "cfgScale": 8.0,
            "height": 1024,
            "width": 1024,
            "seed": seed,
        }
    }
    
    try:
        response = bedrock_client.invoke_model(modelId="amazon.titan-image-generator-v1", body=json.dumps(native_request))
        model_response = json.loads(response["body"].read())
        
        # Extract and decode the image data
        base64_image_data = model_response["images"][0]
        image_data = base64.b64decode(base64_image_data)

        # Uploading image to S3 bucket
        s3_client.put_object(Bucket=bucket_name, Key=s3_image_path, Body=image_data)

        # Return the S3 path as response
        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Image generated successfully", "s3_path": f"s3://{bucket_name}/{s3_image_path}"})
        }

    except Exception as e:
        # Handle errors
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Image generation failed", "error": str(e)})
        }