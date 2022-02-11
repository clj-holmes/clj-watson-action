# clj-watson action

Action to execute [clj-watson](https://github.com/clj-holmes/clj-watson) security dependency scan in Clojure/Clojurescript projects.

# Getting Started
Simply add the following snippet to your GitHub actions workflow.
```yaml
- name: Dependencies scan
  uses: clj-holmes/clj-watson-action@main
```

## Options
It's also possible to specify the following options:
- deps-edn-path [Required]
- dependency-check-properties [Default: default property file]
- output-type (json, edn or stdout) [Default: stdout]
- fail-on-result (true or false) [Default: false]
- suggest-fix (true or false) [Default: false]

```yaml
- name: Dependency scan
  uses: clj-holmes/clj-watson-action@main
  with:
    deps-edn-path: 'deps.edn'
    output-type: 'output'
    suggest-fix: 'true'
    fail-on-result: 'true'
```
