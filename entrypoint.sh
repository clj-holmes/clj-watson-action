#!/bin/bash

clj_watson_tag="$1"
clj_watson_sha="$2"
deps_edn_path="$3"
aliases="$4"
dependency_check_properties="$5"
output_type="$6"
fail_on_result="$7"
suggestion_fix="$8"
database_strategy="$9"
output_cmd="clojure -Sdeps \"{:deps {io.github.clj-holmes/clj-watson {:git/tag \\\"${clj_watson_tag}\\\" :git/sha \\\"${clj_watson_sha}\\\"}}}\" -M -m clj-watson.cli scan -p ${deps_edn_path}"

if [[ ! -z $aliases ]]; then
  IFS=','
  read -a strarr <<< "$aliases"
  for alias in "${strarr[@]}";
  do
    output_cmd="${output_cmd} -a ${alias}"
  done
fi

if [[ $fail_on_result == "true" ]]; then
  output_cmd="${output_cmd} --fail-on-result";
else
  output_cmd="${output_cmd} --no-fail-on-result";
fi

if [[ ! -z $dependency_check_properties ]]; then
  output_cmd="${output_cmd} -d ${dependency_check_properties}";
fi

if [[ ! -z $output_type ]]; then
  output_cmd="${output_cmd} -o ${output_type}";
fi

if [[ $suggestion_fix  == "true" ]]; then
  output_cmd="${output_cmd} -s";
fi

if [[ ! -z $database_strategy ]]; then
  output_cmd="${output_cmd} -t ${database_strategy}";
fi

cd /github/workspace/

bash -c "${output_cmd}"
