# {{ project-name }}

Author: {{ author_full }}

{{ description }}

## Parameters

| Name | Description | Default |
------
| `externalSecrets.enabled` | A value indicating whether [ESO](https://external-secrets.io/latest/) integration should be enabled | `false` |
| `externalSecrets.storeConfig` | Additional config to pass in to the SecretStore composition, see below for documentation on the different supported secretstores | `{}` |
| `externalSecrets.certificateStoreConfig` | Config to create a separate secret store for certificates | `{}` |
| `externalSecrets.secrets` | A list of secrets to pull in using ESO | `[]` |
| `externalSecrets.certificates` | A list of certificates to pull in using ESO | `[]` |
| `{{wrapped-chart }}` | The values to pass to the wrapped chart | |
| `gatewayApi.enabled` | A value indicating whether to create GatewayApi route resources like HTTPRoute, etc. | `false` |
| `gatewayApi.gateway.create` | A value indicating whether to create the Gateway as well. | `false` |
| `gatewayApi.gateway.name` | The name of the Gateway to use/create. If not specified and `gatewayApi.gateway.create` is `true`, defaults to the release name. | `""` |
| `gatewayApi.gateway.namespace` | The namespace of the Gateway to use. If `gatewayApi.gateway.create` is `true`, this field is ignored. | `""` |
| `gatewayApi.gateway.className` | The name of the GatewayClass the created Gateway should use. Ignored unless `gatewayApi.gateway.create` is `true` | `""` |
| `gatewayApi.gateway.sectionName` | The listener on the Gateway that the created HTTPRoute should be attached to. | `https` |

## Configuring External Secrets

Secrets can be pulled into the cluster from cloud secret managers by leveraging External Secrets Operator. You can enable External Secrets integration by configuring the SecretStore and specifying the list of secrets or certificates. You can also specify a different SecretStore for secrets vs certificates.

### Secret Store Config

The `externalSecrets.storeConfig` and `externalSecrets.certificateStoreConfig` is passed as-is to the composition.

**AWS**
```yaml
externalSecrets:
  enabled: true
  storeConfig:
    region: us-east-2
    enableAccessManagement: true
```

**Azure**
```yaml
externalSecrets:
  enabled: true
  storeConfig:
    vaultName: my-existing-key-vault
    enableAccessManagement: true
```

### Pulling in Secrets

You can pass in the list of secrets you wish to pull in from the remote secret store via `externalSecrets.secrets`. Each item can have the following values.

| Name | Description | Default |
--------
| `name` | The name of the secret key on the remote secret provider (required) |
| `target` | The name of the kubernetes secret where the remote secret should be downloaded. If not specified, defaults to the `name` | `""` |
| `format` | The format of the remote secret. Can be `raw` or `json` | `json` |

If format is `json`, the remote secret will be interpreted as a JSON string and all of the keys of the JSON object will be pulled in to the secret.
If the format is `raw`, the remote secret will be interpreted as plaintext/binary data and the data will be present under the `value` key in the kubernetes data.

### Pulling in Certificates

You can pass in the list of certificates you wish to pull in from the remote secret store via `externalSecrets.certificates`. The created kubernetes secret will have type `kubernetes.io/tls`. Each item can have the following values.

| Name | Description | Default |
--------
| `name` | The name of the secret key on the remote secret provider (required) |
| `target` | The name of the kubernetes secret where the remote certificate should be downloaded. If not specified, defaults to the `name` | `""` |
| `format` | The format of the remote certificate. Can be `pkcs12` or `pem` | `pkcs12` |

