Automating Updates the Publication List
========================================

The script `update_json_w_bibtex.sh` will perform queries of the following CNERG
Publication sub-collections, getting the most recent 100 items in each and
storing them in different files.

* Refereed Publications -> pub.json
* Thesis Archive -> theses.json

In order to complete this task, the user must have [generated a Oauth
key](https://www.zotero.org/settings/keys/new) with their own Zotero account.
That key should exist in a the file `zotero/zotero.key.header`.  This file
should only contain the following:

```
Zotero-API-Key: <key-goes-here>
```

where `<key-goes-here>` should be replaced with your own custom key which will
be a 24 character string composed of upper- and lower-case letters and numbers.

When generating the key, it is (probably) necessary to select "Allow library
access" and "Read Only" for the Default Group Permissions.


