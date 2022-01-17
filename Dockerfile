FROM sprkl/npm

# make a directory for the application, otherwise files will be copied to the root folder
RUN mkdir -p /var/opt/employee-microservice-node
WORKDIR /var/opt/employee-microservice-node

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install --production --quiet

RUN npm link sprkl

# Add source files
COPY . .

ENV PORT 8000
EXPOSE 8000
