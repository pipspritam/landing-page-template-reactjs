FROM node:alpine

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