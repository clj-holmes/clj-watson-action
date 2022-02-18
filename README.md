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
- clj-watson-sha [Required]
- clj-watson-tag [Required]
- aliases (separated by comma)
- database-strategy (github-advisory or dependency-check)
- deps-edn-path [Required]
- dependency-check-properties [Default: default property file]
- output-type (json, edn or stdout) [Default: stdout]
- fail-on-result (true or false) [Default: false]
- suggest-fix (true or false) [Default: false]

```yaml
- name: Dependency scan
  uses: clj-holmes/clj-watson-action@aliases-support
  with:
    clj-watson-sha: "47d3321"
    clj-watson-tag: "v3.0.0"
    database-strategy: github-advisory
    aliases: clojure-lsp,test 
    deps-edn-path: 'deps.edn'
    output-type: 'stdout-simple'
    suggest-fix: 'true'
    fail-on-result: 'true'
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
