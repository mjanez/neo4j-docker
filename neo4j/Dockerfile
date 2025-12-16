ARG NEO4J_VERSION
LABEL maintainer="mjanez.9tc2v@passmail.com"
LABEL version="${NEO4J_VERSION}"
LABEL description="Neo4j stack with APOC, GDS & Neosemantics"

FROM neo4j:${NEO4J_VERSION}-community

# Check compat at: https://github.com/neo4j-labs/neosemantics/releases
ARG N10S_VERSION

# Download Neosemantics
ADD --chown=neo4j:neo4j https://github.com/neo4j-labs/neosemantics/releases/download/${N10S_VERSION}/neosemantics-${N10S_VERSION}.jar /plugins/

# Copy configuration files
COPY --chown=neo4j:neo4j neo4j/setup/neo4j.conf.template /conf/neo4j.conf