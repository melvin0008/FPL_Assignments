datatype 'a tree = leaf | node  of 'a * 'a tree * 'a tree;


fun insert(i, leaf) =  node(i,leaf,leaf)
     | insert(i, node(v,left,right)) =
         case Int.compare(i,v) of
         EQUAL =>   node(v,left,right)
   |     GREATER => node(v,left,insert(i,right))
   |     LESS =>    node(v,insert(i,left),right)

fun testcase() =
  let val t1 = node(100,leaf,leaf);
    val t2 = insert(50, t1);
    val t3 = insert(150, t2);
    val t4 = insert(200, t3);
    val t5 = insert(125, t4);
    val t6 = insert(175, t5);
    val t7= insert(250,t6);
    val t8 = insert(25, t7);
    val root = insert(75, t8)
  in
    root
end;

fun dfirst(leaf) = []
 | dfirst(node(v,t1,t2)) = dfirst(t1) @ [v] @ dfirst(t2);

(*Experimental function fun dfirst(leaf,acc) = acc
 | dfirst(node(v,t1,t2),acc) = dfirst(t1,v::dfirst(t2,acc))
*)

fun dfirst2(tree) =
 let fun depth(mytree, acc) =
       case mytree of
       [] => acc
       | head::mytree=>
           case head of
           leaf =>acc
           |node(value,leaf,leaf) => depth(mytree,value::acc)
           |node(value,left,leaf)=>depth([node(value,leaf,leaf)]@[left]@mytree,acc)
           |node(value,leaf,right)=>depth([right]@[node(value,leaf,leaf)]@mytree,acc)
           |node(value,left,right) =>depth([right]@[node(value,leaf,leaf)]@[left]@mytree,acc)
 in
    depth([tree],[])
 end


val test1= dfirst(testcase())
val test2= dfirst2(testcase())
