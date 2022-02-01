activate_asdf () {
	ENABLED_ASDF=1 zsh
}

sync_to_build () {
	#cd ${HOME}/airyhq/airy.build
	#git checkout develop
	#git reset --hard HEAD


	cd ${HOME}/airyhq/airy.core
	for file in $(git ls-files -m -o --exclude-standard); do
		cp -v $file ${HOME}/airyhq/airy.build/$file
	done

	for file in $(git ls-files -d --exclude-standard); do
		rm -vrf ${HOME}/airyhq/airy.build/$file
	done
}

bazel () {
	if [[ "$(pwd)" == *"/airyhq/airy.core"* ]]; then
		echo "don't use bazel in airy.core"
	else
		/usr/local/bin/bazel $@
	fi
}
