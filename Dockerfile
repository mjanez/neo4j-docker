FROM neo4j:5.26.0-community

# Check compat at: https://github.com/neo4j-labs/neosemantics/releases
ENV N10S_VERSION=5.26.0

# Download Neosemantics
ADD https://github.com/neo4j-labs/neosemantics/releases/download/${N10S_VERSION}/neosemantics-${N10S_VERSION}.jar /plugins/

USER root
RUN chown neo4j:neo4j /plugins/neosemantics-${N10S_VERSION}.jar
USER neo4j
