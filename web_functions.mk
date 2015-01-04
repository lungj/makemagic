### Download a file
# Example usage: $(call download,url,outfile)
ifeq ($(call CMD_EXISTS,wget),0)
 download = (export OUTFILE=$(2); wget -O $${OUTFILE} $(1)) || (rm "$(2)" && exit 1)
else ifeq ($(call CMD_EXISTS,curl),0)
 download = (export OUTFILE=$(2); curl -L -o $${OUTFILE} $(1)) || (rm "$(2)" && exit 1)
else
 download = (echo "No downloader installed."; exit 1)
 download.missing:
	$(error No downloader installed)
endif	
