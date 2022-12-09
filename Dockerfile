FROM python:3.10-slim

WORKDIR /app
COPY . /app

RUN python -m pip install --upgrade pip
RUN pip install pipenv
# 安装项目所需的所有依赖项
RUN pipenv install --system --skip-lock --deploy
# 执行Python脚本
CMD ["python", "main.py"]
