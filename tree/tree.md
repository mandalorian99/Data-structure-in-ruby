## Impletation of Generic Binary Tree in Ruby

# OBJECTIVE
1. creating a generic binary tree
2. adding child to node of a tree
3. creating a tree statically
4. inserting node into tree
5. traversing tree
6. learn all algo to traverse a treed

# 1. Implementation of Binary tree
A Binary tree node can have atmost to child nodes. Each node consist of reference of its right child , left child and value.This value could be anything from number, string to a obj.We can visualize a node of a binary tree as a object below .
LeftChid and rightChid also refer to a obj of node class itself.
```ruby
  node = {
     leftChild: {....}
     rightChild: {...}
     data: ..value...
  }
```
Here is how we can implement a node in ruby
```ruby
class Node
  attr_reader :name
  attr_accesor :leftChild, :rightChild
  
  def initialize(name)
    @leftChild = nil
    @rightChild = nil
    @name = name
  end
  
  def getLeftChild
    return @leftChild
  end
  
  def getRightChild
    return @rightChild
  end
end
```

Now each reference of Node class refer as node .
```ruby
class Tree
  attr_reader :root

  def initialize(name)
    @root = Node.new name
  end
  
  def getRoot
    return @root
  end
end
```
We can initialize a binary tree by creating a instance of tree. This instance of tree contain refrence to all other nodes.

```ruby
# driver logic
# Creating a generic tree statcially as of now
# later use insert method to- create nodes
# This will create below generic tree
#         xyz pvt ltd
#          /        \
#     manager1     manager2
#     /      \      /     \
#    e1      e2    e3     e4 
@my_tree = Tree.new("xyz pvt ltd")
#level 1
node1 = @my_tree.addNodeChild(@my_tree.root, "manager1")
node2 = @my_tree.addNodeChild(@my_tree.root, "manager2")
#level -2 
node3 = @my_tree.addNodeChild node1, "e1"
node4 = @my_tree.addNodeChild node1, "e2"

node5 = @my_tree.addNodeChild node2, "e3"
node6 = @my_tree.addNodeChild node2, "e4"
```

# 2.Adding child nodes
Below code snippet help you to add  child's to any given node.It is specifically use to add child's to node.First it check base condition that root is not empty, then it will check its leftChild and if its not empty it add new node to left of current node else to its right .

```ruby
def addNodeChild(node, value)
  if @root != nil
    if node.leftChild
      node.leftChild = Node.new value
      return node.leftChild
    else
      node.rightChild = Node.new value
      return node.leftChild
    end
  end
end
```
