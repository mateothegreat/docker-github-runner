FROM python:3.11-buster

ENV AWS_CLI_VER=2.8.13

RUN apt update
RUN apt install -y 	curl \
					docker \
					gcc \
					git \
					jq \
					openssl \
					unzip \
					wget \
					zip

COPY requirements.txt .

RUN pip3 install -U pip
RUN pip3 install -r requirements.txt

RUN curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN mv kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN wget "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_linux_amd64.zip" && \
    unzip "./terraform_1.3.4_linux_amd64.zip" -d /usr/local/bin

COPY entrypoint.sh .

WORKDIR /home/runner

COPY bin bin
COPY src src

RUN ./bin/install.sh

RUN addgroup runner
RUN adduser --home /home/runner --ingroup runner runner
RUN chown -R runner /home/runner

USER runner

ENTRYPOINT ["/entrypoint.sh"]
