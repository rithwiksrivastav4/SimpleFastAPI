FROM python:3.12.7-alpine
LABEL author="khaja" organization="lt"
USER nobody
COPY --chown=nobody . /app
WORKDIR /app
EXPOSE 8000
RUN pip install --no-cache-dir -r requirements.txt
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]