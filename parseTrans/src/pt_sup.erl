-module(pt_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

-compile({crud}).
%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

%doSetup() -> crud:setup(table, [one, two, three], []).

init([]) ->
crud:setup(table, [one, two, three], []),
    {ok, { {one_for_one, 5, 10}, []} }.

