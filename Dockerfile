FROM metasploitframework/metasploit-framework:latest

# Custom entrypoint ensures .msf4 volume has correct permissions before
# the main entrypoint runs (which switches to the msf user)
COPY docker/entrypoint.sh /usr/local/bin/msf-entrypoint.sh
COPY docker/msfconsole.rc /usr/local/share/msf/msfconsole.rc
RUN chmod +x /usr/local/bin/msf-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/msf-entrypoint.sh"]
CMD ["./msfconsole", "-r", "docker/msfconsole.rc", "-y", "/usr/src/metasploit-framework/config/database.yml"]
