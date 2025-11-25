% Supervizor
-module(sup).
-behaviour(supervisor).
-export([start_link/0, init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    io:format("sup:start_link~n"),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{
        strategy => one_for_all,
        intensity => 0,
        period => 1
    },
    ChildSpecs = [],
    io:format("sup:init~n"),
    {ok, {SupFlags, ChildSpecs}}.
