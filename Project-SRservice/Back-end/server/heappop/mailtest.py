import os, copy
import smtplib               # SMTP 라이브러리
from string import Template  # 문자열 템플릿 모듈
from email.mime.multipart import MIMEMultipart
from email.mime.text      import MIMEText
from email.mime.image     import MIMEImage
import EmailContent
import EmailSender


'''filelist=os.listdir('./image')
print(filelist)'''


str_host    = 'smtp.gmail.com'
num_port    = 587 # SMTP Port
emailSender = EmailSender.EmailSender(str_host, num_port)

str_subject = 'hello with image' # e메일 제목
template = Template("""<html>
                            <head></head>
                            <body>
                                Hi ${NAME}.<br>
                                <img src="cid:my_image1"><br>
                                This is a test message.
                            </body>
                        </html>""")
template_params = {'NAME':'Everyone'}

path_dir='./image'
file_list=os.listdir(path_dir)
for file_name in file_list:
    receiver=file_name[:-4]
    sender='SmuHeapPop@gmail.com'
    str_cid_name='my_image1'
    str_image_file_name=path_dir+'/'+file_name
    emailHTMLImageContent = EmailContent.EmailHTMLImageContent(str_subject,str_image_file_name,str_cid_name, template, template_params)
    str_to_eamil_addrs  = [receiver] # 수신자리스트
    emailSender.send_message(emailHTMLImageContent, sender, str_to_eamil_addrs)
    os.remove(str_image_file_name)

