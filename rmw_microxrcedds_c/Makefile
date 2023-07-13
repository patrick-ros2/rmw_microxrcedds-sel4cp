SHELL = /bin/zsh
PWD_DIR = "$(shell basename $$(pwd))"
BUILD_DIR = build

# ==================================
# Pushes the current directory to remote host.
# ==================================

NUM_PROCS = 4
REMOTE_USER_HOST = "patrick@vm_comp4961_ubuntu1804"
REMOTE_DEST_DIR = "~/remote/$(shell hostname -s)/"

.PHONY: push-remote
push-remote:
	# Make the directory on the remote if it doesn't exist already.
	(ssh -t $(REMOTE_USER_HOST) "mkdir -p $(REMOTE_DEST_DIR)$(PWD_DIR)")
	# Sync our current directory with the remote.
	(rsync -a \
 			--delete \
 			--exclude "build" \
 			--exclude "build-remote" \
 			--exclude "cmake-build*" \
 			--exclude ".vscode" \
 			--exclude ".idea" \
 			--exclude ".git" \
 			--exclude ".gitignore" \
 			./ $(REMOTE_USER_HOST):$(REMOTE_DEST_DIR)$(PWD_DIR))

# ==================================
# Runs a Make command remotely.
# ==================================

.PHONY: remote
remote: push-remote
	ssh -t $(REMOTE_USER_HOST) "\
		cd $(REMOTE_DEST_DIR)$(PWD_DIR) ; \
		zsh -ilc 'make $(MAKE_CMD)' ; "

# ==================================
# Clean
# ==================================

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# ==================================
# Build
# ==================================

.PHONY: build
build:
	CC=aarch64-none-elf-gcc CXX=aarch64-none-elf-g++ \
		cmake -S . -B $(BUILD_DIR) \
		-DBUILD_TESTING=0 \
		-DCMAKE_C_COMPILER_WORKS=1 \
		-DCMAKE_CXX_COMPILER_WORKS=1 \
		-DCMAKE_MODULE_PATH=./
	cd $(BUILD_DIR) && $(MAKE) -j $(NUM_PROCS)
	cd $(BUILD_DIR) && sudo $(MAKE) install

#Install the project...
#-- Install configuration: ""
#-- Up-to-date: /usr/local/include
#-- Installing: /usr/local/include/rmw_microros
#-- Installing: /usr/local/include/rmw_microros/custom_transport.h
#-- Installing: /usr/local/include/rmw_microros/time_sync.h
#-- Installing: /usr/local/include/rmw_microros/init_options.h
#-- Installing: /usr/local/include/rmw_microros/rmw_microros.h
#-- Installing: /usr/local/include/rmw_microros/timing.h
#-- Installing: /usr/local/include/rmw_microros/continous_serialization.h
#-- Installing: /usr/local/include/rmw_microros/discovery.h
#-- Installing: /usr/local/include/rmw_microros/error_handling.h
#-- Installing: /usr/local/include/rmw_microros/ping.h
#-- Installing: /usr/local/include/rmw_microxrcedds_c
#-- Installing: /usr/local/include/rmw_microxrcedds_c/rmw_c_macros.h
#-- Installing: /usr/local/include/rmw_microxrcedds_c/config.h
#-- Installing: /usr/local/lib/librmw_microxrcedds.a
