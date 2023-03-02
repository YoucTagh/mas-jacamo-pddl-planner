domain(domain("hanoi", [
  action("move", ["?disc", "?from", "?to"],
    and(smaller("?to", "?disc"), on("?disc", "?from"), clear("?disc"), clear("?to")),
    and(clear("?from"), on("?disc", "?to"), not(on("?disc", "?from")), not(clear("?to"))))
])) .

problem(problem("hanoi3","hanoi", [
   smaller(peg1, d1), smaller(peg1, d2), smaller(peg1, d3),
   smaller(peg2, d1), smaller(peg2, d2), smaller(peg2, d3),
   smaller(peg3, d1), smaller(peg3, d2), smaller(peg3, d3),
   smaller(d2, d1), smaller(d3, d1), smaller(d3, d2),
   clear(peg2), clear(peg3), clear(d1),
   on(d3, peg1), on(d2, d3), on(d1, d2)
],
  and(on(d3, peg3),on(d2, d3),on(d1,d2))
)).


+!start :
    domain(Domain) & problem(Problem)
    <-
    // build a Jason plan from a PDDL domain/problem definition
    buildPlan(Domain, Problem, Plan) ;
    // add the plan to the agent's plan library
    .print(Plan) ;
    .add_plan(Plan) ;
  .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }