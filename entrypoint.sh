#!/bin/bash

clj_watson_tag="$1"
clj_watson_sha="$2"
deps_edn_path="$3"
aliases="$4"
dependency_check_properties="$5"
output_type="$6"
fail_on_result="$7"
suggestion_fix="$8"


echo "${aliases}"
output_cmd="scan -p ${deps_edn_path}"

if [[ $fail_on_result == "true" ]]; then
  fail_on_result_cmd="--fail-on-result";
else
  fail_on_result_cmd="--no-fail-on-result";
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

cd /github/workspace/
clojure -Sdeps "{:deps {io.github.clj-holmes/clj-watson {:git/tag \"${clj_watson_tag}\" :git/sha \"${clj_watson_sha}\"}}}" -M -m clj-watson.cli $output_cmd
