%%%-------------------------------------------------------------------
%%% @author zhk
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2015 5:56 PM
%%%-------------------------------------------------------------------
-module(my_file_client).
-author("zhk").

%% API
-export([ls/1,get_file/2]).

ls(Server) ->
  Server ! {self(),list_dir},
  receive
    {Server,FileList} ->
      FileList
  end.
get_file(Server,File) ->
  Server ! {self(),{get_file,File}},
  receive
    {Server,Content} ->
      Content
  end.