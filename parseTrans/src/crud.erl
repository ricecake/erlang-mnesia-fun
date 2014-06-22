-module(crud).

-compile({parse_transform, parse_trans_codegen}).

-export([setup/3]).

%%-pt_pp_forms(true).
-pt_pp_src(true).

setup(Table, Fields, Properties) when   is_atom(Table)  andalso
                                        is_list(Fields) andalso
                                        is_list(Properties) ->
        [codegen:gen_function(Field, fun(Record)-> {Table, 3*Record, Field} end)|| Field <- Fields].