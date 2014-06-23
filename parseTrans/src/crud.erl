-module(crud).

-compile({parse_transform, parse_trans_codegen}).

-export([parse_transform/2]).

%%-pt_pp_forms(true).
-pt_pp_src(true).

parse_transform(ASTIn, _Options) ->
io:format("~p~n", [ASTIn]),
        Transform = fun({_, _, _, Def}) ->
                [setup(Def)]
        end,
        {ok, {setup, ASTOut}} = repAttr(setup, ASTIn, [], Transform),
io:format("~p~n", [lists:reverse(ASTOut)]),
        lists:reverse(ASTOut).

repAttr(Name, [], ASTOut, _Trans) -> {ok, {Name, ASTOut}};%{error, {Name, undefined}};
repAttr(Name, [{attribute, _, Name, _} = Node| Rest], ASTOut, Trans) ->
        NewNode = Trans(Node),
        repAttr(Name, Rest, lists:append(NewNode,ASTOut), Trans);
repAttr(Name, [Node|Rest], ASTOut, Trans) -> repAttr(Name, Rest, [Node|ASTOut], Trans).

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
setup({Table, Fields, Properties})->% when is_atom(Table)  andalso
                                     %   is_list(Fields) andalso
                                      %  is_list(Properties) ->
        [codegen:gen_function(Field, fun(Record)-> X= 3+4, {X, 3*Record} end)|| Field <- Fields].