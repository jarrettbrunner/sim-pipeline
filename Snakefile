IDS, = glob_wildcards("scripts/{id}")

rule all:
    input:
        'test.txt', expand("data/{id}.txt", id=IDS)

rule run_scripts:
    input:
        "scripts/{example}"
    output:
        "data/{example}.txt"
    shell:
        "touch {output}"

rule make_model:
    input:
        expand("data/{id}.txt", id=IDS)
    output:
        "test.txt"
    notebook:
        "model.py.ipynb"
