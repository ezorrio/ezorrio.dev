export PATH="$PATH":"$HOME/.pub-cache/bin"

function prompt() {
  if [ -n "$ZSH_VERSION" ]; then
    read -q -r "choice?$1 [y/N/e(xit)]."
  elif [ -n "$BASH_VERSION" ]; then
    read -p "$1?[y/N/e(xit)] (No by default) " -n 1 -r choice
  fi

  case $choice in
  y|Y) echo 1 ;;
  n|N) echo 0 ;;
  e|E) exit ;;
  *) echo 1 ;;
  esac
}

echo # (optional) move to a new line
build_proto=$(prompt "Regenerate proto models?")
echo
if [[ $build_proto == 1 ]]; then
  build_protoc_plugin=$(prompt "Rebuild protoc_plugin?")
  echo
  if [[ $build_protoc_plugin == 1 ]]; then
    dart pub global deactivate protoc_plugin
  fi
  dart pub global activate protoc_plugin
  rm -rf lib/model/generated/*
  protoc --dart_out=grpc:lib/model/generated --proto_path=protos/v2 -Iprotos errors.proto frontend.proto models.proto user_management.proto account.proto google/protobuf/empty.proto google/protobuf/timestamp.proto
fi

build_freezed=$(prompt "Rebuild freezed models?")
echo
if [[ $build_freezed == 1 ]]; then
  flutter pub run build_runner build --delete-conflicting-outputs
fi