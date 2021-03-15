import json
import boto3
import os
import io
import pandas as pd
import time

ddb = boto3.resource('dynamodb', region_name='eu-west-2')
table = ddb.Table('Datasource-b747sdtqs5e2hdg6l3ibuvml3q-dev')
s3 = boto3.client("s3")

def lambda_handler(event, context):
    s3 = boto3.client("s3")
    s3_resource = boto3.resource("s3")
    if event:
        s3_records = event["Records"][0]
        bucket_name = str(s3_records["s3"]["bucket"]["name"])
        file_name = str(s3_records["s3"]["object"]["key"])
        file_obj = s3.get_object(Bucket=bucket_name, Key=file_name)
        file_content = file_obj["Body"].read()
        read_excel_data = io.BytesIO(file_content)
        df = pd.read_excel(read_excel_data)
        var = df.to_json(orient="split")
        table.update_item(
        Key={'description': file_name},
        UpdateExpression="SET processing = :updated, SET description = :description",                   
        ExpressionAttributeValues={':updated': False, ':description': var})
