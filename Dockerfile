FROM datadog/agent:6.6.0

LABEL maintainer="TreeHouse <dev@treehouse.nl>"

RUN curl -L -o /tmp/extras.zip https://github.com/DataDog/integrations-extras/archive/master.zip \
    && python -m zipfile -e /tmp/extras.zip /tmp \
    && pip install /tmp/integrations-extras-master/eventstore
