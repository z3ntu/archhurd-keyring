V=20171126

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archhurd{.gpg,-trusted} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/archhurd{.gpg,-trusted}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=archhurd-keyring-$(V)/ $(V) | gzip -9 > archhurd-keyring-$(V).tar.gz
	gpg --detach-sign --use-agent archhurd-keyring-$(V).tar.gz

.PHONY: install uninstall dist
