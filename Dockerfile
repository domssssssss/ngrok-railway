FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y curl unzip && \
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc > /dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt update && apt install -y ngrok

# Set your Ngrok auth token (Replace YOUR_AUTH_TOKEN later)
ENV NGROK_AUTHTOKEN=YOUR_AUTH_TOKEN

# Start Ngrok (Change 8080 if needed)
CMD ngrok http 80 --log=stdout
