import json
import boto3
import time

s3_client = boto3.client('s3')
bucket_name = 'pgr301-couch-explorers'

def lambda_handler(event, context):
    for record in event['Records']:
        # Hent meldingen fra SQS
        message_body = json.loads(record['body'])
        print(f"Processing message: {message_body}")

        # Simuler bildebehandling (kan erstatte med faktisk bildebehandling)
        time.sleep(10)  # Simulerer bildebehandlingstid

        # Lagre det genererte bildet til S3
        file_name = f"image_{int(time.time())}.jpg"
        s3_client.put_object(Bucket=bucket_name, Key=file_name, Body=b"image_data_here")
        
        # Skriv ut status
        print(f"Image saved to S3: {file_name}")

    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }
