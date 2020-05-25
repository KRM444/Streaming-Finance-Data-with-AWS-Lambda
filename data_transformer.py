import json

def lambda_handler(event, context):
    output_records = []
    for record in event["records"]:
        print(type(record["data"]))
        print((record["data"]))
        output_records.append({
            "recordId": record['recordId'],
            "result": "Ok",
            "data": record["data"] + "Cg=="
        })
        
    print(len(output_records))
    print(output_records)
    print(event['records'])
        
    return { "records": output_records }