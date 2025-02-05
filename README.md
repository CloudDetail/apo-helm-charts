# apo

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add apo https:clouddetail.github.io/apo-helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
apo` to see the charts.

To install the apo chart:

    helm install apo apo/apo -n apo --create-namespace

To uninstall the chart:

    kubectl delete clickhouseinstallation apo -napo
    helm uninstall apo -n apo

## License

[Apache 2.0 License](./LICENSE).