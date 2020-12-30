wget --header="`cat zotero.key.header`" -O ../_data/pub.json 'https://api.zotero.org/groups/10058/collections/UKXV4KID/items?format=json&include=data,bibtex&itemType=-attachment&sort=date&limit=100'
wget --header="`cat zotero.key.header`" -O ../_data/theses.json 'https://api.zotero.org/groups/10058/collections/6259B6TV/items?format=json&include=data,bibtex&itemType=-attachment&sort=date&limit=100'

