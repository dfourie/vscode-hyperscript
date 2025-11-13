
set -e

version=$(jq <package.json '.version')

build_vscode() {
	npx @vscode/vsce package -o dist/vscode-hyperscript-org-${version}.vsix
}

build_subl() {
	cd syntaxes
	zip ../dist/_hyperscript.sublime-package \
		'_hyperscript.tmLanguage' \
		'HTML (_hyperscript).sublime-syntax'
	cd ..
}

[ -d dist ] || mkdir dist
npm run build
build_vscode
build_subl

