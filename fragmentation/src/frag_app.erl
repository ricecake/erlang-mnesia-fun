-module(frag_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
        mnesia:create_schema([node()]),
        mnesia:start(),
        mnesia:create_table(dict, [{attributes,[prim_key,prim_val]}, {disc_copies, [node()]},
                                   {frag_properties, [{n_fragments, 64}]}]),
    frag_sup:start_link().

stop(_State) ->
    ok.
