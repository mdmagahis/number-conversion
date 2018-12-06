-module(convert).

% -ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
% -endif.

-export([d2b/1, d2h/1, d2n/2]).
-export([d2b_test/0,d2h_test/0,d2n_test/0]).

-type base() :: 2..26.

%% -----------------------------------------------------------------------------

-spec d2b(pos_integer()) -> string().

d2b(Num) ->
  d2n(Num,2).
% d2b(0) ->
%   "0";
% d2b(1) ->
%   "1";
% d2b(N) ->
%   d2b(N div 2) ++ d2b(N rem 2).

-spec d2h(pos_integer()) -> string().

d2h(Num) ->
  d2n(Num, 16).
% d2h(0) ->
%   "0";
% d2h(1) ->
%   "1";
% d2h(2) ->
%   "2";
% d2h(3) ->
%   "3";
% d2h(4) ->
%   "4";
% d2h(5) ->
%   "5";
% d2h(6) ->
%   "6";
% d2h(7) ->
%   "7";
% d2h(8) ->
%   "8";
% d2h(9) ->
%   "9";
% d2h(10) ->
%   "A";
% d2h(11) ->
%   "B";
% d2h(12) ->
%   "C";
% d2h(13) ->
%   "D";
% d2h(14) ->
%   "E";
% d2h(15) ->
%   "F";
% d2h(Num) ->
%   d2h(Num div 16) ++ d2h(Num rem 16).

-spec d2n(pos_integer(), base()) -> string().

d2n(Num, Base) when Num < Base ->
  lists:nth(Num+1,["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"]);
d2n(Num, Base) ->
  d2n(Num div Base, Base) ++ d2n(Num rem Base, Base).

%% -----------------------------------------------------------------------------

% -ifdef(TEST).

d2b_test() ->
  [?_assertEqual("0", d2b(0)),
   ?_assertEqual("1", d2b(0)),
   ?_assertEqual("11111111", d2b(256))].

d2h_test() ->
  [?_assertEqual("0", d2b(0)),
   ?_assertEqual("1", d2b(1)),
   ?_assertEqual("11111111", d2b(255))].

d2n_test() ->
  [?_assertEqual("1111111111111111", d2n(65535,2)),
   ?_assertEqual("58406520", d2n(1480615200,16)),
   ?_assertEqual("200", d2n(128,8))].

% -endif.
