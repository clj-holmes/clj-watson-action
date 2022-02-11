#!/bin/bash

deps_edn_path="$1"
dependency_check_properties="$2"
output_type="$3"
fail_on_result="$4"
suggestion_fix="$5"

clj_watson_tag="v2.1.2"
clj_watson_sha="5e43eae"

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
  output_cmd="${output_cmd} -t ${output_type}";
fi

if [[ $suggestion_fix  == "true" ]]; then
  output_cmd="${output_cmd} -s";
fi

cd /github/workspace/
clojure -Sdeps "{:deps {io.github.clj-holmes/clj-watson {:git/tag \"${clj_watson_sha}\" :git/sha \"${clj_watson_sha}\"}}}" -M -m clj-watson.cli "$output_cmd"
