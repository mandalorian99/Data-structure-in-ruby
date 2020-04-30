class Node
	attr_reader :name
	attr_accessor :leftChild, :rightChild

  def initialize name
  	@leftChild = nil
  	@leftRight = nil
  	@name = name
  end

  def getRightChild
  	return @rightChild
  end 

  def getLeftChild
  	return @lefChild
  end
end

class Tree
	attr_reader :root

	def initialize name
		@root = Node.new name
	end

	def addNodeChild(node, value)
		if @root != nil
			if node.leftChild == nil
				node.leftChild = Node.new value
				return node.leftChild
			else
				node.rightChild = Node.new value
				return node.rightChild
			end
		end
	end

	def breath_first_traverse value=nil
		queue = []
		queue << getRoot

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
  
  # Depth first methods
	def in_order_traverse node
		return if node == nil
		in_order_traverse node.leftChild
		p node.name
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

puts ">> tree traversal approches..."
puts "===== 1. inorder tree traversal======"
@my_tree.in_order_traverse(@my_tree.getRoot)
puts "=====2. preorder tree traversal======"
@my_tree.pre_order_traverse(@my_tree.getRoot)
puts "====3. post order tree traversal====="
@my_tree.post_order_traverse(@my_tree.getRoot)
puts "====4. breath first traversal===="
@my_tree.breath_first_traverse nil