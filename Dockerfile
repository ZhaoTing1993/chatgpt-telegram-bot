FROM python:3.10-slim

WORKDIR /app
COPY . /app

RUN python -m pip install --upgrade pip
RUN pip install pipenv
# 安装项目所需的所有依赖项
RUN pipenv install --skip-lock
# 执行Python脚本
RUN pipenv run python main.py