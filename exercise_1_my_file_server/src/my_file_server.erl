%%%-------------------------------------------------------------------
%%% @author zhk
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Jan 2015 10:22 PM
%%%-------------------------------------------------------------------
-module(my_file_server).
-author("zhk").

%% API
-export([start/1,loop/1]).
start(Dir) -> spawn(my_file_server,loop,[Dir]).
loop(Dir) ->
  receive
    {Client,list_dir} ->
      Client!{self(),file:list_dir(Dir)};
    {Client,{get_file,File}} ->
      Full = filename:join(Dir,File),
      Client!{self(),file:read_file(Full)}

  end,
  loop(Dir).