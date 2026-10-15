/-  *docket, hood, treaty
/+  *server, *hood, agentio, default-agent, multipart, dbug, verb
|%
+$  card  card:agent:gall
+$  app-state
  $:  %6
      ::  local
      charges=(map desk charge)
  ==
::  $cache: impermanent state
+$  cache
  by-base=(map term desk)
::
+$  inflated-state
  [app-state cache]
::  +lac: toggle verbosity
++  lac  &
::
++  ver
  |%
  ++  poke  1
  ++  scry  1
  ++  peer  1
  --
::
--
^-  agent:gall
%-  agent:dbug
%+  verb  |
=|  inflated-state
=*  state  -
=<
|_  =bowl:gall
+*  this  .
    io    ~(. agentio bowl)
    pass  pass:io
    def   ~(. (default-agent this %|) bowl)
    cc    ~(. +> bowl)
    ch    ch:cc
    cg    cg:cc
::
++  on-init
  ^-  (quip card _this)
  :_  this
  :~  ~(tire pass /tire)
      (~(connect pass /eyre) / %docket)
      (~(connect pass /eyre) /apps %docket)
      (~(connect pass /eyre) /docket %docket)
      (~(connect pass /eyre) /session %docket)
      (~(wait pass /init) (add 1 now.bowl))
  ==
::
++  on-load
  |=  =vase
  ^-  (quip card _this)
  |^
  =+  !<(old=app-states vase)
  =?  old    ?=(?(~ ^) -.old)  [%1 old]
  =^  cards-1  old
    ?.  ?=(%1 -.old)  `old
    `old(- %2)
  =^  cards-2  old
    ?.  ?=(%2 -.old)  `old
    :_  old(- %3)  :_  ~
    ~(tire pass /tire)
  =^  cards-3  old
    ?.  ?=(%3 -.old)  `old
    :_  old(- %4)  :_  ~
    [%pass /reinstall %agent [our.bowl dap.bowl] %poke %reinstall-groups !>(~)]
  =^  cards-4  old
    ?.  ?=(%4 -.old)  `old
    :_  old(- %5)  :_  ~
    =/  =cage  [%kiln-suspend !>(`desk`%garden)]
    [%pass /suspend %agent [our.bowl %hood] %poke cage]
  =^  cards-5  old
    ?.  ?=(%5 -.old)  `old
    :_  old(- %6)
    :~  (~(connect pass /eyre) /docket %docket)
        (~(connect pass /eyre) /session %docket)
    ==
  ?>  ?=(%6 -.old)
  ::TODO  remove globs from state
  =/  cards-tire  [~(tire pass /tire) ~]
  =.  -.state  old
  ::  inflate-cache needs to be called after the state is set
  ::
  =.  +.state  inflate-cache
  [:(weld cards-1 cards-2 cards-3 cards-4 cards-5 cards-tire) this]
  ::
  ++  inflate-cache
    ^-  cache
    %-  ~(gas by *(map term desk))
    %+  murn  ~(tap by charges)
    |=  [=desk =charge]
    ?.  ?=(%glob -.href.docket.charge)  ~
    `:_(desk base.href.docket.charge)
  ::
  +$  app-states
    $^  state-0-ket
    $%  state-0-sig
        state-1
        state-2
        state-3
        state-4
        state-5
        app-state
    ==
  ::
  +$  state-5  [%5 (map desk charge)]
  +$  state-4  [%4 (map desk charge)]
  +$  state-3  [%3 (map desk charge)]
  +$  state-2  [%2 (map desk charge)]
  +$  state-1  [%1 (map desk charge)]
  +$  state-0-sig
    $:  ~
    ==
  ::
  +$  state-0-ket
    $:  (map desk charge)
    ==
  --
::

++  on-save  !>(-.state)
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  =^  cards  state
    ?+  mark  (on-poke:def:cc mark vase)
      %docket-install    (install !<([ship desk] vase))
      %docket-uninstall  (uninstall !<(desk vase))
    ::
        %noun
      =+  ;;([%kick =desk] q.vase)
      :_(state ~(fetch-glob ch desk))
    ::
        %handle-http-request
      =+  !<([id=@ta req=inbound-request:eyre] vase)
      (handle-http-request:cc id req)
    ::
        %reinstall-groups
      :_  state
      =+  .^  sources=(map desk [=ship desk])  %gx
              /(scot %p our.bowl)/hood/(scot %da now.bowl)/kiln/sources/noun
          ==
      =/  talk    (~(get by sources) %talk)
      =/  groups  (~(get by sources) %groups)
      %+  welp
        ?:  &(?=(^ talk) =(%earl (clan:title ship.u.talk)))  ~
        :_  ~
        :*  %pass  /reinstall/talk  %agent  [our.bowl %hood]  %poke
            %kiln-install  !>([%talk ~sogryp-dister-dozzod-dozzod %talk])
        ==
      ?:  &(?=(^ groups) =(%earl (clan:title ship.u.groups)))  ~
      :_  ~
      :*  %pass  /reinstall/groups  %agent  [our.bowl %hood]  %poke

          %kiln-install  !>([%groups ~sogryp-dister-dozzod-dozzod %groups])
      ==
    ==
  [cards this]
  ::
  ++  install
    |=  [=ship =desk]
    ^-  (quip card _state)
    =+  .^(=treaty:treaty %gx (scry:io %treaty /treaty/(scot %p ship)/[desk]/noun))
    ?:  (~(has by charges) desk)
      ~|  bad-install-desk/desk
      !!
    =.  charges
      (~(put by charges) desk docket.treaty %install ~)
    =*  cha   ~(. ch desk)
    :_  state
    ~[add-fact:cha (install:cha ship desk)]
  ::
  ++  uninstall
    |=  =desk
    ^-  (quip card _state)
    =/  =charge  ~|(no-charge-installed+desk (~(got by charges) desk))
    =.  charges  (~(del by charges) desk)
    =?  by-base  ?=(%glob -.href.docket.charge)
      (~(del by by-base) base.href.docket.charge)
    =*  cha  ~(. ch desk)
    :_  state
    ~[del-fact:cha uninstall:cha]
  --
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  =^  cards  state
    ?+  path  (on-watch:def path)
        [%http-response *]
      `state
    ::
        [%charges ~]
      `state
    ::
        [%glob @ @ ~]
      =*  base  i.t.path
      =/  hash  (slav %uv i.t.t.path)
      ~|  [%glob-unavailable requested=hash have=%gone]
      !!
    ==
  [cards this]
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  [~ ~]
    [%x %ver %poke ~]  ``noun+!>(poke:ver)
    [%x %ver %peer ~]  ``noun+!>(peer:ver)
    [%x %ver %scry ~]  ``noun+!>(scry:ver)
    [%x %our ~]  ``json+!>(s+(scot %p our.bowl))
    ::
      [%x %dbug %state ~]
    =-  ``noun+!>(-)
    %_  state
        charges
      %-  ~(run by charges)
      |=  =charge
      =?  chad.charge  ?=(%glob -.chad.charge)
        :-  %glob
        %-  ~(run by glob.chad.charge)
        |=(=mime mime(q.q 1.337))
      charge
    ==
    ::
      [%x %charges ~]
    =/  tyr
      .^(rock:tire:clay %cx /(scot %p our.bowl)//(scot %da now.bowl)/tire)
    :-  ~  :-  ~
    %-  charge-update:cg
    :-  %initial
    %-  ~(gas by *(map desk charge))
    %+  murn  ~(tap by charges)
    |=  [=desk =charge]
    ?~  got=(~(get by tyr) desk)
      ~
    ?:  ?&  ?=(%dead zest.u.got)
            ?=(~ (get-apps-have our.bowl desk now.bowl))
        ==
      ~
    `u=[desk (get-light-charge charge)]
    ::
      [%x %charges @ %version ~]
    ?~  charge=(~(get by charges) i.t.t.path)
      [~ ~]
    ``noun+!>(version.docket.u.charge)
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  |^
  =^  cards  state
    ?+  wire  ~&(bad-docket-take+wire `state)
      ~  `state
      [%rein ~]       ~&(%reined `state)
      [%nuke ~]       ~&(%nuked `state)
      [%kiln ~]       `state
      [%charge @ *]   (take-charge i.t.wire t.t.wire)
      [%reinstall *]  `state
      [%suspend ~]    `state
    ==
  [cards this]
  ::
  ++  take-charge
    |=  [=desk =^wire]
    ^-  (quip card _state)
    ~|  [%took-for-nonexistent-charge desk]
    ?>  |((~(has by charges) desk) ?=([%uninstall ~] wire))
    =*  cha  ~(. ch desk)
    =/  pre  (~(get by charges) desk)
    ?+  wire  ~|(%bad-charge-wire !!)
    ::
        [%install ~]
      ?>  ?=(%poke-ack -.sign)
      ?~  p.sign
        `state
      =.  charges  (new-chad:cha hung+'Failed install')
      %.  [(new-cache:cha pre) state]
      (slog leaf+"Failed installing %{(trip desk)}" u.p.sign)
    ::
        [%uninstall ~]
      ?>  ?=(%poke-ack -.sign)
      ?~  p.sign  `state
      ((slog leaf+"Failed to uninstall %{(trip desk)}" u.p.sign) `state)
    ::
        [%glob @ ?(%http %ames) @ ~]
      `state  ::  globs removed, no-op on outstanding results
    ==
  --
::
++  on-arvo
  |=  [=wire gift=gift-user-v1:gall]
  |^
  =^  cards  state
    ?+  wire  (on-arvo:def wire gift)
        [%init ~]
      =*  cha  ~(. ch q.byk.bowl)
      =.  charges  (~(put by charges) q.byk.bowl [docket:cha %install ~])
      [fetch-glob:cha state]
    ::
        [%eyre ~]
      ?>  ?=([%eyre %bound *] gift)
      ?:  bound.gift   `state
      ~&  [dap.bowl %failed-to-bind path.binding.gift]
      `state
    ::
        [%tire ~]
      ?>  ?=([%clay %tire *] gift)
      ?-  -.p.gift
        %&  (on-rock p.p.gift)
        %|  (on-wave p.p.gift)
      ==
    ::
        [%warp * ~]
      ?>  ?=([%clay %read *] gift)
      (on-writ i.t.wire riot.gift)
    ==
  [cards this]
  ::
  ++  on-rock
    |=  tyr=rock:tire:clay
    ^-  (quip card _state)
    =|  fex=(list card)
    =/  ark  ~(tap by tyr)
    |-  ^-  (quip card _state)
    ?~  ark  [(flop fex) state]
    =^  caz  state  (on-zest [p zest.q]:i.ark)
    $(ark t.ark, fex (weld (flop caz) fex))
  ::
  ++  on-wave
    |=  =wave:tire:clay
    ^-  (quip card _state)
    ?-  -.wave
      %wait  `state
      %warp  `state
      %zest  (on-zest +.wave)
    ==
  ::
  ++  on-zest
    |=  [=desk =zest:clay]
    ^-  (quip card _state)
    =*  cha  ~(. ch desk)
    =/  card-1
      ::TODO  check if request already outstanding
      (~(warp-our pass /warp/[desk]) ~ desk %sing %z da+now.bowl /desk/docket-0)
    =^  cards-2  state
      ?.  (~(has by charges) desk)
        `state
      =/  =charge  (~(got by charges) desk)
      ?:  &(?=(%install -.chad.charge) ?=(%held zest))
        `state
      ?-    zest
          %live
        ?.  ?=(%glob -.href.docket.charge)
          =.  charges  (new-chad:cha %site ~)
          :_(state [add-fact:cha (new-cache:cha `charge)])
        :_(state ~[add-fact:cha])
      ::
          ?(%held %dead)
        =/  glob=(unit glob)
          ?:(?=(%glob -.chad.charge) `glob.chad.charge ~)
        =.  charges  (new-chad:cha %suspend glob)
        :_(state [add-fact:cha (new-cache:cha `charge)])
      ==
    [[card-1 cards-2] state]
  ::
  ++  on-writ
    |=  [=desk =riot:clay]
    ^-  (quip card _state)
    =/  card-1
      ::TODO  check if request is already outstanding
      (~(warp-our pass /warp/[desk]) ~ desk %next %z da+now.bowl /desk/docket-0)
    =^  cards-2  state
      =*  cha   ~(. ch desk)
      =/  tyr
        .^(rock:tire:clay %cx /(scot %p our.bowl)//(scot %da now.bowl)/tire)
      ?.  =(%live zest:(~(got by tyr) desk))
        `state
      ?.  docket-exists:cha
        ::  ~?  ?&  !=(%base desk)
        ::          !=(%kids desk)
        ::      ==
        ::    [dap.bowl %no-docket-file-for desk]
        ?.  (~(has by charges) desk)
          `state
        :-  ~[del-fact:cha]
        state(charges (~(del by charges) desk))
      ::  always update the docket in state to match clay's
      ::
      =/  =docket            docket:cha
      =/  pre=(unit charge)  (~(get by charges) desk)
      =.  charges            (new-docket:cha docket)
      ::  if the new chad is a site, we're instantly done
      ::
      ?:  ?=(%site -.href.docket)
        =.  charges  (new-chad:cha %site ~)
        :-  [add-fact:cha (new-cache:cha pre)]
        state
      ::
      =.  by-base  (~(put by by-base) base.href.docket desk)
      ::  if the glob specification is unchanged, keep it
      ::
      ?:  &(?=(^ pre) =(href.docket.u.pre href.docket) ?=(%glob -.chad.u.pre))
        [~[add-fact:cha] state]
      ::  if the glob spec changed, but we already host it, keep it
      ::  (this is the "just locally uploaded" case)
      ::
      ?:  ?&  ?=(^ pre)
              ?=(%glob -.chad.u.pre)
            ::
              .=  [(sham glob.chad.u.pre) %ames our.bowl]
              glob-reference.href.docket
          ==
        [~[add-fact:cha] state]
      ::  if the glob changed, forget the old and fetch the new
      ::
      =.  charges  (new-chad:cha %install ~)
      [[add-fact:cha (weld fetch-glob:cha (new-cache:cha pre))] state]
    [[card-1 cards-2] state]
  --
::
++  on-fail  on-fail:def
++  on-leave  on-leave:def
--
::
|_  =bowl:gall
++  io    ~(. agentio bowl)
++  pass  pass:io
++  def   ~(. (default-agent state %|) bowl)
::
++  hash-glob  sham
++  cg
  |%
  ++  glob            |=(g=^glob glob-0+!>(g))
  ++  docket          |=(d=^docket docket-0+!>(d))
  ++  charge-update   |=(u=^charge-update charge-update+!>(u))
  ++  kiln-uninstall  |=(=desk kiln-uninstall+!>(desk))
  ++  kiln-install
    |=([here=desk her=ship there=desk] kiln-install+!>([here her there]))
  --
::
++  handle-http-request
  |=  [eyre-id=@ta inbound-request:eyre]
  ^-  (quip card _state)
  ::
  =;  [payload=simple-payload:http caz=(list card) =_state]
    :_  state
    %+  weld  caz
    (give-simple-payload:app eyre-id payload)
  ::
  ::NOTE  we don't use +require-authorization-simple here because we want
  ::      to short-circuit all the below logic for the unauthenticated case.
  ?.  authenticated
    :_  [~ state]
    =-  [[307 ['location' -]~] ~]
    (cat 3 '/~/login?redirect=' url.request)
  ::
  =*  headers   header-list.request
  =/  req-line  (parse-request-line url.request)
  ::
  |^  ?+  method.request  [[405^~ ~] ~ state]
        %'GET'   [handle-get-request ~ state]
      ==
  ::
  ++  handle-get-request
    ^-  simple-payload:http
    ?+  [site ext]:req-line  [[404 ~] `(as-octs:mimes:html 'docket catch-all 404')]
        [[%$ ~] ~]  ::  root
      (redirect:gen '/apps/landscape/')
    ::
        [[%session ~] [~ %js]]
      ^-  simple-payload:http
      ~&  '/session.js deprecated, use /~/host (or /~/name)'
      %.  (as-octs:mimes:html (rap 3 'window.ship = "' (rsh 3 (scot %p our.bowl)) '";' ~))
      %*  .  js-response:gen
        cache  %.n
      ==
    ==
  --
::
++  get-light-charge
  |=  =charge
  ?.  ?=(%glob -.chad.charge)  charge
  charge(glob.chad *glob)
::  +ch: Charge engine
++  ch
  |_  =desk
  ++  pass  |=(=wire ~(. ^pass [%charge desk wire]))
  ++  glob-wire
    |=  glob-reference
    ^-  wire
    :+  %glob
      (scot %uv hash)
    ?-  -.location
      %http  /http/(scot %t url.location)
      %ames  /ames/(scot %p ship.location)
    ==
  ++  add-fact
    =/  =charge  (~(got by charges) desk)
    =-  (fact:io - /charges ~)
    (charge-update:cg %add-charge desk (get-light-charge charge))
  ++  del-fact  (fact:io (charge-update:cg %del-charge desk) /charges ~)
  ++  install
    |=  [=ship remote=^desk]
    (poke-our:(pass /install) %hood (kiln-install:cg desk ship remote))
  ++  uninstall
    (poke-our:(pass /uninstall) %hood (kiln-uninstall:cg desk))
  ++  new-docket
    |=  d=^docket
    %+  ~(put by charges)  desk
    [d chad:(~(gut by charges) desk *charge)]
  ++  new-chad  |=(c=chad (~(jab by charges) desk |=(charge +<(chad c))))
  ++  new-cache
    |=  old=(unit charge)
    ^-  (list card)
    ::NOTE  we used to %set-response but don't anymore to avoid clashing.
    ::      globs are deprecated, use desk-local foo-fileserver instead.
    ~
  ++  fetch-glob
    ^-  (list card)
    ~
  ++  docket-loc  `path`/desk/docket-0
  ++  docket-exists
    ?:  =(0 ud:.^(cass:clay %cw (scry:io desk ~)))  %.n
    .^(? %cu (scry:io desk docket-loc))
  ::
  ++  docket  .^(^docket %cx (scry:io desk docket-loc))
  --
--
