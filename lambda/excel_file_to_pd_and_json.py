import json
import numpy as np
import boto3
import io
import pandas as pd
import datetime as dt
from decimal import Decimal
import os


def lambda_handler(event, context):
    jsonBuffer = io.StringIO()
    s3 = boto3.client("s3")
    s3_resource = boto3.resource("s3")
    for record in event['Records']:
        bucket_name = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        keyname_s3 = "{keyname}.json".format(keyname=key)
        file_obj = s3.get_object(Bucket=bucket_name, Key=key)
        file_content = file_obj["Body"].read()
        read_excel_data = io.BytesIO(file_content)
        df = pd.read_excel(read_excel_data, index_col=None, header=None, skiprows=4, usecols='J,K,L,P,T,AF,AJ,AN,AR,AT,AU,AV', names=['Date','Time','Step1','Step2','Step3','Step4','Step5','Step6','Step7','DateE','TimeE','EndTimeLength'])
        df.loc[:,'DateStart'] = pd.to_datetime(df.Date.astype(str)+' '+df.Time.astype(str))
        df['TIME_END'] = pd.to_timedelta(df['TimeE'].astype(str))
        df['ENDADD'] = pd.to_timedelta(df['EndTimeLength'].astype(str))
        df['TimeEE'] = df['TIME_END'] + df['ENDADD']
       
        Step1Mean = pd.to_timedelta(df['Step1'].astype(str))
        Step2Mean = pd.to_timedelta(df['Step2'].astype(str))
        Step3Mean = pd.to_timedelta(df['Step3'].astype(str))
        Step4Mean = pd.to_timedelta(df['Step4'].astype(str))
        Step5Mean = pd.to_timedelta(df['Step5'].astype(str))
        Step6Mean = pd.to_timedelta(df['Step6'].astype(str))
        Step7Mean = pd.to_timedelta(df['Step7'].astype(str))
        Step8Mean = pd.to_timedelta(df['EndTimeLength'].astype(str))
        
        step1meanresult = Step1Mean.mean() / 60000
        step1min = Step1Mean.min() / 60000
        step2meanresult = Step2Mean.mean() / 60000
        step2min = Step2Mean.min() / 60000
        step3meanresult = Step3Mean.mean() / 60000
        step3min = Step3Mean.min() / 60000
        step4meanresult = Step4Mean.mean() / 60000
        step4min = Step4Mean.min() / 60000
        step5meanresult = Step5Mean.mean() / 60000
        step5min = Step5Mean.min() / 60000
        step6meanresult = Step6Mean.mean() / 60000
        step6min = Step6Mean.min() / 60000
        step7meanresult = Step7Mean.mean() / 60000
        step7min = Step7Mean.min() / 60000
        step8meanresult = Step8Mean.mean() / 60000
        step8min = Step8Mean.min() / 60000
        step1max = Step1Mean.max() / 6000
        step2max = Step2Mean.max() / 6000
        step3max = Step3Mean.max() / 6000
        step4max = Step4Mean.max() / 6000
        step5max = Step5Mean.max() / 6000
        step6max = Step6Mean.max() / 6000
        step7max = Step7Mean.max() / 6000
        step8max = Step8Mean.max() / 6000



        df['TimeEndResult'] = pd.to_timedelta(df['TimeEE'].astype(str))
        df.loc[:,'DateEnd'] = pd.to_datetime(df.DateE.astype(str)+' '+df.TimeE.astype(str))
        df['hours_to_complete'] = (df.DateEnd - df.DateStart + df.TimeEndResult) / pd.Timedelta(hours=1)
        df['month'] = pd.DatetimeIndex(df['DateStart']).month
        seriesObj = df.apply(lambda x: True if x['month'] == 1 else False , axis=1)
        numOfRowsjan = len(seriesObj[seriesObj == True].index)
        seriesObj2 = df.apply(lambda x: True if x['month'] == 2 else False , axis=1)
        numOfRowsfeb = len(seriesObj2[seriesObj2 == True].index)
        seriesObj3 = df.apply(lambda x: True if x['month'] == 3 else False , axis=1)
        numOfRowsmar = len(seriesObj3[seriesObj3 == True].index)
        seriesObj4 = df.apply(lambda x: True if x['month'] == 4 else False , axis=1)
        numOfRowsapr = len(seriesObj4[seriesObj4 == True].index)
        seriesObj5 = df.apply(lambda x: True if x['month'] == 5 else False , axis=1)
        numOfRowsmay = len(seriesObj5[seriesObj5 == True].index)
        seriesObj6 = df.apply(lambda x: True if x['month'] == 6 else False , axis=1)
        numOfRowsjun = len(seriesObj6[seriesObj6 == True].index)
        seriesObj7 = df.apply(lambda x: True if x['month'] == 7 else False , axis=1)
        numOfRowsjul = len(seriesObj7[seriesObj7 == True].index)
        seriesObj8 = df.apply(lambda x: True if x['month'] == 8 else False , axis=1)
        numOfRowsaug = len(seriesObj8[seriesObj8 == True].index)
        seriesObj9 = df.apply(lambda x: True if x['month'] == 9 else False , axis=1)
        numOfRowssep = len(seriesObj9[seriesObj9 == True].index)
        seriesObj10 = df.apply(lambda x: True if x['month'] == 10 else False , axis=1)
        numOfRowsoct = len(seriesObj10[seriesObj10 == True].index)
        seriesObj11 = df.apply(lambda x: True if x['month'] == 11 else False , axis=1)
        numOfRowsnov = len(seriesObj11[seriesObj11 == True].index)
        seriesObj12 = df.apply(lambda x: True if x['month'] == 12 else False , axis=1)
        numOfRowsdec = len(seriesObj12[seriesObj12 == True].index)
        timeperprocessaverage = df['hours_to_complete'].mean()
        num_entries = df.shape[0]
        takttimejan = (173 * 60) / numOfRowsjan
        takttimefeb = (173 * 60) / numOfRowsfeb
        takttimemar = (173 * 60) / numOfRowsmar
        takttimeapr = (173 * 60) / numOfRowsapr
        takttimemay = (173 * 60) / numOfRowsmay
        takttimejun = (173 * 60) / numOfRowsjun
        takttimejul = (173 * 60) / numOfRowsjul
        takttimeaug = (173 * 60) / numOfRowsaug
        takttimesep = (173 * 60) / numOfRowssep
        takttimeoct = (173 * 60) / numOfRowsoct
        takttimenov = (173 * 60) / numOfRowsnov
        takttimedec = (173 * 60) / numOfRowsdec


    
        df1 = df.filter(['ID','Number','hours_to_complete'])
        d = {'AverageTime': [timeperprocessaverage], 'Jan': [takttimejan], 'Feb': [takttimefeb], 'Mar': [takttimemar], 'Apr': [takttimeapr], 'May': [takttimemay], 'Jun': [takttimejun], 'Jul': [takttimejul], 'Aug': [takttimeaug],  'Sep': [takttimesep], 'Oct': [takttimeoct], 'Nov': [takttimenov], 'Dec': [takttimedec], 'NumRows': [num_entries],
            'Step1Mean': [step1meanresult], 'Step1Max': [step1max], 'Step1Min': [step1min], 'Step2Mean': [step2meanresult], 'Step2Max': [step2max], 'Step2Min': [step2min], 'Step3Mean': [step3meanresult], 'Step3Max': [step3max], 'Step3Min': [step3min], 'Step4Mean': [step4meanresult], 'Step4Max': [step4max], 'Step4Min': [step4min], 'Step5Mean': [step5meanresult], 'Step5Max': [step5max], 'Step5Min': [step5min], 'Step6Mean': [step6meanresult], 'Step6Max': [step6max], 'Step6Min': [step6min], 'Step17Mean': [step7meanresult], 'Step7Max': [step7max], 'Step7Min': [step7min], 'Step8Mean': [step8meanresult], 'Step8Max': [step8max], 'Step8Min': [step8min] }
        df2 = pd.DataFrame(data=d)
        result = df2.to_json(orient="records")
        parsed = json.loads(result)
        s3.put_object(Bucket=bucket_name, Key=keyname_s3, Body=result)

