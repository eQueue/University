# Image_Resolution_Improving_with_CNN
### 1. CNN Architecture
<div align="center">
	<img src="./Project-SRservice/Document/CNN layer.JPG"/>
</div>

#### 1-1 사용 손실함수(Mean Squared Error, MSE)
손실 함수는 실제값과 예측값의 차이(loss, cost)를 수치화해주는 함수이다.
오차가 클수록 손실 함수의 값이 크고, 오차가 작을수록 손실 함수의 값이 작아진다.
[Mean Squared Error, MSE]
평균제곱오차는 손실 함수로 가장 많이 쓰인다. 간단하게 설명하면 예측하는 값이랑 실제 값의 차이(error)를 제곱하여 평균을 낸 것이 평균제곱오차이다. 
예측 값과 실제 값의 차이가 클수록 평균제곱오차의 값도 커진다는 것은 이 값이 작을 수록 예측력이 좋다고 할 수 있다.

#### 1-2 사용 옵티마이저(ADAM)
손실함수를 최소화하기 위하여 파라미터를 조정해주는 도구

### 2. Preprocessing 
학습 목적에 맞는 이미지로 사진을 crop 하여 전처리한다.

### 3. Train


### 4. Result
모델은 groundtruth값에 근접하도록 학습된다.

### 5. Dependancy
- Python3+
- Keras 2.3
- Tensorflow 2.3.0
- OpenCV
- Matplotlib
