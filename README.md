# Naviqore Deployment

This repository provides the deployment configurations for the Naviqore public transit service and viewer. You can
deploy the services using either a Helm chart for Kubernetes or Docker Compose for local development.

## Helm Chart

To deploy the Naviqore service and viewer using Helm, follow these steps:

### Installation

```bash
helm install my-public-transit .
```

#### Change URL of GTFS

To change the GTFS feed URL without modifying the values.yaml file, you can override the value directly in the helm
install or helm upgrade command:

```bash
helm install my-public-transit . --set publicTransitService.env.GTFS_STATIC_URI=https://your-new-gtfs-url.com/feed.zip
```

Alternatively, you can create a separate `override-values.yaml` file:

```yaml
publicTransitService:
  env:
    GTFS_STATIC_URI: https://your-new-gtfs-url.com/feed.zip
```

Then install or upgrade using this file:

```bash
helm install my-public-transit . -f override-values.yaml
```

### Development with Minikube

To run the services locally using Minikube:

Start Minikube:

```bash
minikube start
```

Start and access the viewer:

```bash
helm install testing .
# Note: depending on the size of GTFS to load, it may take some time for the viewer to be availbale
minikube service public-transit-viewer
```

Stop Minikube:

```bash
helm uninstall testing
minikube delete
```

## Docker Compose

For local development, you can use Docker Compose to deploy locally.

Start the Services:

```bash
cd docker
docker compose up
```

Stop the Services:

```bash
docker compose down
```