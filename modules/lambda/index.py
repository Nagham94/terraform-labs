import boto3

def handler(event, context):
    ses = boto3.client('ses')

    ses.send_email(
        Source='naghamfathy94@gmail.com',
        Destination={
            'ToAddresses': ['naghamfathy94@gmail.com']
        },
        Message={
            'Subject': {'Data': 'Terraform Alert'},
            'Body': {
                'Text': {
                    'Data': 'State file has changed!'
                }
            }
        }
    )

    return "Email sent!"