# Implementation of Generic binary tree 
class Node
    attr_reader :value
    attr_accessor :leftChild, :righChild
  def initialize(name)
    @leftChild = nil
    @righChild = nil
    @name = name
  end
  
  def getLeftChildNode
    return @leftChild
  end
  
  def getRightChildNode
    return @righChild
  end
end

class Tree
  attr_reader :root
  def initialize(val)
    @root = Node.new(val)
  end
  
  # Add child node to any given node
  def addNodeChild(node, value)
    if @root != nil
      if node.leftChild == nil
        node.leftChild = Node.new value
        return node.leftChild
      else 
        node.righChild = Node.new value
        return node.righChild
      end
    end
  end
  
  def getRoot
    return @root
  end
end


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


