function conda --wraps 'conda'
    echo 'Initializing conda...'
    functions --erase conda
    /home/niklas/.more/apps/miniconda3/bin/conda "shell.fish" "hook" | source
    function __conda_add_prompt; end
    conda $argv
end
