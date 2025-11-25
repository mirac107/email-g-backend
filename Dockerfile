FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application files
COPY . .

# Expose ports
EXPOSE 8080 2525

# Set environment variables
ENV PORT=8080
ENV SMTP_PORT=2525
ENV NODE_ENV=production

# Start the application
CMD ["npm", "start"]

