FROM node:alpine

WORKDIR /app

# Copy application source
COPY . .


# Install dependencies as root
RUN npm install


# Build the application
RUN npm run build

# Set proper ownership
RUN chown -R daemon:daemon /app

# Switch to non-root user
USER daemon

EXPOSE 3000

CMD ["npm", "start"]