-module(pt_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1, one/1]).
%-compile({parse_transform, crud}).
%-setup({table, [one], []}).

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

%one(A) -> A*3.

init([]) ->
%crud:setup(table, [one, two, three], []),
        X= 3+4,
    {ok, { {one_for_one, 5, 10}, [X]} }.


-export([two/1]).
two(A) -> A.