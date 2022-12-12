FROM python:3.10-slim

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser/

ENV PATH="/home/appuser/.local/bin:$PATH"
#RUN python -m pip install --upgrade pip
RUN pip install --user pipenv

WORKDIR /home/appuser/app
COPY . .
COPY .env .

# 安装项目所需的所有依赖项
#RUN pipenv install --system --skip-lock --deploy
RUN pipenv install --system --deploy --ignore-pipfile
# 执行Python脚本
CMD ["python", "main.py"]
