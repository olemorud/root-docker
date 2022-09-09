FROM gentoo/portage
FROM gentoo/stage3

ENV PORTAGEDIR=/var/db/repos/gentoo

COPY --from=gentoo/portage ${PORTAGEDIR} ${PORTAGEDIR}

COPY ./portage /etc/portage



# Fix Perl conflicts ( https://wiki.gentoo.org/wiki/Perl )
RUN emerge --tree -verbose --newuse -deep dev-lang/perl
#RUN emerge -uDNv --backtrack=100 --autounmask-keep-masks=y @world


RUN emerge --tree --verbose --update --newuse --deep sci-physics/root \
 && rm -rf /tmp/* ${PORTAGEDIR} /var/tmp/portage

CMD ["root", "-b"]
