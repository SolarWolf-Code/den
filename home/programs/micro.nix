{...}: {
	programs.micro = {
		enable = true;
		settings = {
			colorscheme = "simple";
			"lsp.autocompleteDetails" = false;
		    "lsp.formatOnSave" = true;
		    "lsp.ignoreMessages" = "LS message1 to ignore|LS message 2 to ignore|...";
		    "lsp.ignoreTriggerCharacters" = "completion,signature";
		    "lsp.server" = "python=pyls,go=gopls,typescript=deno lsp,rust=rls";
		    "lsp.tabcompletion" = true;
		};
	};
}
