FROM node:alpine

# 1. Explicitly create the /app directory and give the 'node' user ownership
RUN mkdir -p /app && chown -R node:node /app

# 2. Set the working directory
WORKDIR /app

# Copy application source
COPY . .

# Install dependencies as root
RUN npm install

# Build the application
RUN npm run build

# Set proper ownership
RUN chown -R pritam:pritam /app

# Switch to non-root user
USER pritam

EXPOSE 3000

CMD ["npm", "start"]