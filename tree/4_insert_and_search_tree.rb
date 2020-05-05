class Node
	attr_accessor :leftChild, :rightChild
	attr_reader :name

  def initialize name
    @leftChild = nil
    @rightChild = nil
    @name = name
  end
end

class Tree
	attr_accessor :root
	def initialize value
		@root = Node.new value
	end

	# Add node to child
	def addNodeChild node, name
		if @root != nil
		  if !node.leftChild
		  	node.leftChild = Node.new name
		  	return node.leftChild
		  end

		  if !node.rightChild
		  	node.rightChild = Node.new name
		  	return node.rightChild
		  end
		end
	end

	def breath_first_traverse
		root = getRoot
		queue = [] << root

		while queue.length > 0
			puts queue[0].name
			node = queue.shift

			if node.leftChild
				queue << node.leftChild
			end

			if node.rightChild
				queue << node.rightChild
			end
		end
	end

	def in_order_traverse node
		return  if node == nil
		in_order_traverse node.leftChild
		puts node.name
		in_order_traverse node.rightChild
	end

	def pre_order_traverse node
		return if node == nil
		puts node.name
		pre_order_traverse node.leftChild
		pre_order_traverse node.rightChild
	end

	def post_order_traverse node
		return if node == nil
		post_order_traverse node.leftChild
		post_order_traverse node.rightChild
		puts node.name
	end

	def insert parent, name
		node = findNodeByName parent
		if node
			addNodeChild node, name
		else
			puts "No node found....."
		end
	end

	def findNodeByName name
		queue = [] << getRoot
		while queue.length > 0
			node = queue.shift #Dequeue
			if node.name == name
				return node
			else
		    if node.leftChild
		      queue << node.leftChild
		    end
		    
		    if node.rightChild
		  		queue << node.rightChild
		  	end
			end
		end
		return nil
	end

	def getRoot
		@root
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

# traversing 
puts "========Breath first printing tree ============"
@my_tree.breath_first_traverse()
puts "========In order traversing================"
@my_tree.in_order_traverse @my_tree.getRoot
puts "========pre order travsersing ==========="
@my_tree.pre_order_traverse @my_tree.getRoot
puts "========post order traverse============"
@my_tree.post_order_traverse @my_tree.getRoot

# searching 
puts">>"
puts @my_tree.findNodeByName "manager1"
puts @my_tree.findNodeByName "e3"
#inserting 
@my_tree.insert "e1", "foo"
@my_tree.insert "e1", "bar"
@my_tree.insert "e3", "mogol"
@my_tree.insert "e4", "romans"
puts ">>>>>>printing new tree>>>>>>>"
@my_tree.pre_order_traverse @my_tree.getRoot