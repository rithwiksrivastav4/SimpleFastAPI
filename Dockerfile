FROM python:3.12.7-alpine AS builder
# Create a working directory
WORKDIR /app

# Copy requirements.txt into the working directory
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt


FROM python:3.12.7-alpine AS runner
LABEL author="khaja" organization="lt"
USER nobody
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --chown=nobody . /app
WORKDIR /app
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]