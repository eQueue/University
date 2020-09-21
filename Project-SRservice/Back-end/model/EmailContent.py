import os, copy
import smtplib               # SMTP 라이브러리
from string import Template  # 문자열 템플릿 모듈
from email.mime.multipart import MIMEMultipart
from email.mime.text      import MIMEText
from email.mime.image     import MIMEImage

class EmailHTMLContent:
    """e메일에 담길 컨텐츠"""
    def __init__(self, str_subject, template, template_params):
        """string template과 딕셔너리형 template_params받아 MIME 메시지를 만든다"""
        assert isinstance(template, Template)
        assert isinstance(template_params, dict)
        self.msg = MIMEMultipart()
        
        # e메일 제목을 설정한다
        self.msg['Subject'] = str_subject # e메일 제목을 설정한다
        
        # e메일 본문을 설정한다
        str_msg  = template.safe_substitute(**template_params) # ${변수} 치환하며 문자열 만든다
        mime_msg = MIMEText(str_msg, 'html')                   # MIME HTML 문자열을 만든다
        self.msg.attach(mime_msg)
        
    def get_message(self, str_from_email_addr, str_to_eamil_addrs):
        """발신자, 수신자리스트를 이용하여 보낼메시지를 만든다 """
        mm = copy.deepcopy(self.msg)
        mm['From'] = str_from_email_addr          # 발신자
        mm['To']   = ",".join(str_to_eamil_addrs) # 수신자리스트 
        return mm


class EmailHTMLImageContent:
    """e메일에 담길 이미지가 포함된 컨텐츠"""
    def __init__(self, str_subject, str_image_file_name, str_cid_name, template, template_params):
        """이미지파일(str_image_file_name), 컨텐츠ID(str_cid_name)사용된 string template과 딕셔너리형 template_params받아 MIME 메시지를 만든다"""
        assert isinstance(template, Template)
        assert isinstance(template_params, dict)
        self.msg = MIMEMultipart()
        
        # e메일 제목을 설정한다
        self.msg['Subject'] = str_subject # e메일 제목을 설정한다
        
        # e메일 본문을 설정한다
        str_msg  = template.safe_substitute(**template_params) # ${변수} 치환하며 문자열 만든다
        mime_msg = MIMEText(str_msg, 'html')                   # MIME HTML 문자열을 만든다
        self.msg.attach(mime_msg)
        
        # e메일 본문에 이미지를 임베딩한다
        assert template.template.find("cid:" + str_cid_name) >= 0, 'template must have cid for embedded image.'
        assert os.path.isfile(str_image_file_name), 'image file does not exist.'        
        with open(str_image_file_name, 'rb') as img_file:
            mime_img = MIMEImage(img_file.read())
            mime_img.add_header('Content-ID', '<' + str_cid_name + '>')
        self.msg.attach(mime_img)
        
    def get_message(self, str_from_email_addr, str_to_eamil_addrs):
        """발신자, 수신자리스트를 이용하여 보낼메시지를 만든다 """
        mm = copy.deepcopy(self.msg)
        mm['From'] = str_from_email_addr          # 발신자 
        mm['To']   = ",".join(str_to_eamil_addrs) # 수신자리스트 
        return mm
