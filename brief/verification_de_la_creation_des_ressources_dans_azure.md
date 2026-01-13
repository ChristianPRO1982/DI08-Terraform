vérifier que le Blob Container existe réellement et qu’il est accessible,
sans passer par le portail Azure, uniquement en ligne de commande.

connexion ssh :
```az storage container show \
  --account-name datacorpbriefsa \
  --name raw \
  --auth-mode login
```

résultat :
```
{
  "deleted": null,
  "encryptionScope": {
    "defaultEncryptionScope": "$account-encryption-key",
    "preventEncryptionScopeOverride": false
  },
  "immutableStorageWithVersioningEnabled": false,
  "metadata": {},
  "name": "raw",
  "properties": {
    "etag": "\"0x8DE52C052E014EF\"",
    "hasImmutabilityPolicy": false,
    "hasLegalHold": false,
    "lastModified": "2026-01-13T16:25:11+00:00",
    "lease": {
      "duration": null,
      "state": "available",
      "status": "unlocked"
    },
    "publicAccess": null
  },
  "version": null
}
```