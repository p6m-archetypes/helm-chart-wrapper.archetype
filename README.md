# Wrapper Helm Chart Archetype

![Latest Release](https://img.shields.io/github/v/release/p6m-archetypes/helm-chart-wrapper.archetype?style=flat-square&label=Latest%20Release&color=blue)This is an [Archetect](https://archetect.github.io/) archetype.

An archetype for creating a "wrapper" helm chart. In other words it uses another (probably official) helm chart and adds the ability to create useful resources on top of that. It does this by leveraging other useful third-party operators. The helm chart that is generated has the following 3rd party dependencies:

- [External Secrets Operator](https://external-secrets.io/latest/).
- [Crossplane](https://www.crossplane.io/).
- [Crossplane Kubernetes Provider](https://marketplace.upbound.io/providers/upbound/provider-kubernetes).
- The relevant provider that hosts your secretsmanager — more crossplane providers can be found on the [Upbound Marketplace](https://marketplace.upbound.io/).
- Compositions that combine the above resources to create a working [SecretStore](https://external-secrets.io/latest/api/secretstore/) or [ClusterSecretStore](https://external-secrets.io/latest/api/clustersecretstore/).

## Rendering

To generate content from this Archetype, copy and execute the following command:

```sh
  archetect render git@github.com:p6m-archetypes/helm-chart-wrapper.archetype.git#v1
```
