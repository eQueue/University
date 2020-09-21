import os, copy
import smtplib               # SMTP 라이브러리
from string import Template  # 문자열 템플릿 모듈
from email.mime.multipart import MIMEMultipart
from email.mime.text      import MIMEText
from email.mime.image     import MIMEImage
from time import sleep
import EmailContent
import EmailSender
import modeltest_aws

os.chdir('/home/ec2-user/srservice')

'''filelist=os.listdir('./image')
print(filelist)'''


str_host    = 'smtp.gmail.com'
num_port    = 587 # SMTP Port
emailSender = EmailSender.EmailSender(str_host, num_port)

str_subject = 'Processed Image arrived' # e메일 제목
template = Template("""<html>
                            <head></head>
                            <body>
                                Hi ${NAME}.<br>
                                <img src="cid:my_image1"><br>
                                This is a processed image output.
                            </body>
                        </html>""")
template_params = {'NAME':'Everyone'}

path_dir='./image'
result_dir='./ResultOutput'

file_list=os.listdir(path_dir)
for file_name in file_list:
    receiver=file_name[:-4]
    sender='SmuHeapPop@gmail.com'
    str_cid_name='my_image1'
    
    #modelProcessing
    print('Processing file name: ', file_name)
    modeltest_aws.modelProcessing(file_name)
    #처리된 이미지 저장됨

    sleep(1) #이미지가 제대로 저장될시간 기다림

    str_image_file_name=result_dir+'/'+file_name
    emailHTMLImageContent = EmailContent.EmailHTMLImageContent(str_subject, str_image_file_name, str_cid_name, template, template_params)
    str_to_eamil_addrs  = [receiver] # 수신자리스트
    emailSender.send_message(emailHTMLImageContent, sender, str_to_eamil_addrs)
    os.remove(path_dir+'/'+file_name)

