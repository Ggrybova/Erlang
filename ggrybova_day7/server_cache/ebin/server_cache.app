{application, 'server_cache', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['server_cache_app','server_cache_sup']},
	{registered, [server_cache_sup]},
	{applications, [kernel,stdlib]},
	{mod, {server_cache_app, []}},
	{env, []}
]}.