import json
import boto3
import time
import os
import base64

s3_client = boto3.client('s3')
bucket_name = os.environ['S3_BUCKET_NAME']
KANDIDATNUMMER = '82'
seed = int(time.time())

def lambda_handler(event, context):
    for record in event['Records']:
        # Hent meldingen fra SQS queue
        # message_body = json.loads(record['body'])
        message_body = record ['body']
        print(f"Processing message: {message_body}")

      
        time.sleep(10)  # Simulerer behandlingstid for bildet
        
        base64_image_data = message_body["images"][0] 
        image_data = base64.b64decode(base64_image_data)
       

        # Lagre det genererte bildet til S3
        file_name = f"{KANDIDATNUMMER}/generated_images/titan_{seed}.png"
        s3_client.put_object(Bucket=bucket_name, Key=file_name, Body=image_data)
        
    
        print(f"Image saved to S3: {file_name}")

    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }
