# Binary Tree 
# arr =  [10,9,14,42,31,35,27]
class Node
	attr_accessor :leftChild, :rightChild, :data
  def initialize num
  	@leftChild = nil
  	@rightChild = nil
  	@data = num
  end
end

class BinaryTree
	attr_accessor :root
	def initialize num
		@root = Node.new num
	end

	def getRoot
		@root
	end

	def insert num
		current = getRoot
		if current == nil
			@root = Node.new num
			return 
		else
			while true
				return if num == current.data
				if num < current.data
					if current.leftChild == nil
						current.leftChild = Node.new num
						return
					end
					current = current.leftChild
				else
					if current.rightChild == nil
						current.rightChild = Node.new num
						return
					end
					current = current.rightChild
				end
			end
		end
	end

 # pre order traversal
  def pre_order_traversal node
  	return if node == nil
  	puts node.data
  	pre_order_traversal node.leftChild
  	pre_order_traversal node.rightChild
  end
end

# driver logic
arr =  [10,9,14,42,31,35,27]
@bst = BinaryTree.new(31)
#inserting nodes
arr.each do |num|
  @bst.insert(num)
end

#printing tree using pre-order traversal
puts "Printing tree"
@bst.pre_order_traversal @bst.getRoot