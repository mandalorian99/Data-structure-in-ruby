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

## 3. Tree Traversal methods 
Traversing a tree is important part.Unlike linear data strcutrues like array we need a root node to traverse a tree. Generally there are 2 baic approches to traverse a tree

 - A) Breath-first-traversal
 - B) Depth first traversal

Further Depth first traveresal is divided into 3 parts
- a) in-order-traversal
- b) pre-order-traversal
- c) post-order-traversal
Although algorith imlementation is almost similar of  above traversal methods

## 3.1 Breath first traversal
In this method a tree, traversal started from root, traverse each level and then go to next level .
Consider a tree
```js
        xyz company              -> Level-0
        /         \
      manager1    manger2        -> Level-1
      /      \    /     \  
     e1      e2  e3     e4       -> Leve-2
```
traversal sequence using breath first approch would be 
```xyz company->manger1->manager2->e1->e2->e3->e4```
Now lets look at ruby imlementation of breath first traversal approch
### Ruby implementation of Breath first traversal

```ruby
def breath_first_traverse
  root = getRoot
  queue = []
  queue << root
  while queue.length > 0
    puts queue[0].name
    node = queue.shift # pop out from begining
    if node.leftChild
      queue << node.leftChild
    end
    
    if node.rightChild
      queue << node.rightChild
    end
  end
end
```
In above code snippet we intially enqueue root node. After analaying root node we dequeue root node and enques its child node if they are not nil and reapeat till queue.length > 0 .


## 3.2 Depth First Traversal
There are 3 types of depth first traversal approch we can use to traverse a tree
- In order
- pre order
- post order

###  In-order traversal 
In this approch we traverse left subtree and then right sub tree .
Consider following tree :
```js
        xyz company              -> Level-0
        /         \
      manager1    manger2        -> Level-1
      /      \    /     \  
     e1      e2  e3     e4       -> Leve-2
```
Then traversing using in-order approch will result in following sequence ``` e1->manager1->e2->e3->manager2->e4```.
### Algorithm for in-order traversal
We will use recursive approch for in-order traversal
```ruby
def in_order_traverse node
  return if node == nil
  in_order_traverse node.leftChild
  puts node.name
  in_order_traverse node.rightChild
end
```
* Output
``` e1->manager1->e2-> e3->manager2->e4```

### Algorithm for pre-order traversal
```ruby
  def pre_order_traversal
    return if node == nil
    
    puts node.name
    pre_order_traversal node.leftChild
    pre_order_traversal node.rightChild
  end
```
* Output 
``` xyz company->manager1->e1->e2->manager2->e3->e4```

### Alogithm for post-order traversal
```ruby
  def post_order_traverse
     return if node == nil
     post_order_traversal node.leftChild
     post_order_traversal node.rightChild
     puts node.name
  end
```
* Output
``` e1->e2->manager1->e3->e4->manager2-> xyz company```

# 4. Inserting And Searching Node Into A Tree
So far we had constructed our tree by manually creating nodes , remember `addNodeChild` method to which we had to pass parent node and name of child node . 
But now we will insert nodes into a tree dynammically . Using `insert` method we first search for the parent node and then add child to it .To find node we will use `findNodeByName` method which will return node instance .
Here is the ruby implementation of insertion and searching .
### Algorithm for insertion in Binary tree
```ruby
def insert parent, name
  node = findNodeByName(parent)
  if node
    addNodeChild(node, name)
  else
    puts "NO node found"
  end
end
```
Here is algorithm to find node using its name. Remember that we already learned about variaous tree traversal approches. You can use any approch to traverse a tree and find node.Here we will be using `breath first traversal` approch.
```ruby
def findNodeByName name
  queue = [] << getRoot
  while queue.length > 0
    node = queue.shift # dequeue
    if node.name == name
      return node
    else
      if node.leftChild
        queue << node.leftChild # enqueue
      end
      
      if node.rightChild
        queue << node.rightChild #enqueue
      end
    end
  end
  return nil 
end
```
