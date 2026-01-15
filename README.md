# Neo4j Graph stack

A containerized environment for Graph Data Engineering, Semantic Modeling (RDF/OWL), and Graph Data Science.

This repository provides a reproducible stack using [**Neo4j Community Edition**](https://neo4j.com/product/community-edition/) paired with **Jupyter Lab**. It implements an immutable infrastructure pattern by baking critical dependencies directly into the container image.

## Stack Architecture* 
* **Database:** Neo4j Community (Version pinned in `.env.example`).
* **Semantic Layer:** Neosemantics (n10s) for RDF import/export and ontology management. Installed via custom Docker build.
* **Data Engineering:** APOC and Graph Data Science (GDS) libraries enabled.
* **Client:** Jupyter Lab (Python 3.11) with Neo4j Bolt driver, configured for ETL pipelines and analysis.

## Configuration
All configuration is centralized in the `.env.example` file.

Rename it to `.env` and adjust settings as needed.

    cp .env.example .env

## Setup and Usage
1. **Configure Environment**
Review the `.env.example` file. The default settings are optimized for a standard development machine (1GB Heap / 2GB Max).

```bash
cp .env.example .env
```

2. **Build and Run**
The build step is required to fetch the correct Neosemantics jar file.

```bash
docker-compose up -d --build

```

3. **Access Services**
* **Neo4j Browser:** `http://localhost:7474`
* **Jupyter Lab:** `http://localhost:8888`

## Project Structure
* `notebooks/`: Python scripts for data ingestion and graph algorithms.
* `import/`: Directory mapped to Neo4j and Jupyter for CSV datasets and OWL files.
* `data/`: Persisted database files.
* `logs/`: Database logs.

## Semantic Configuration (n10s)
To initialize the semantic config, run the following in the Neo4j Browser or via the provided Python notebook:

```cypher
CREATE CONSTRAINT n10s_unique_uri FOR (r:Resource) REQUIRE r.uri IS UNIQUE;
CALL n10s.graphconfig.init();
```
