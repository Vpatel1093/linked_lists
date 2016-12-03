class Node
	attr_accessor :value, :next_node
	def initialize (value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

class LinkedList
	def initialize(value)
		@head = Node.new(value, nil)
		@tail = @head
	end
	
	def append(value)
		@tail.next_node = Node.new(value,nil)
		@tail = @tail.next_node
	end

	def prepend
		node = Node.new(value,@head)
		@head = node
	end
	
	def size
		count = 1
		return count if @head == @tail
		node = @head
		while node.next_node != nil
			count += 1
			node = node.next_node
		end
		count
	end

	def head
		@head
	end
	
	def tail
		@tail
	end
	
	def at(index)
		return @head if index == 0
		return nil if index > ((self.size)-1)
		node = @head
		position = 0
		while node.next_node != nil
			position += 1
			node = node.next_node
			return node if position == index
		end
	end

	def pop
		return nil if self.size == 1
		node = @head
		while node.next_node.next_node != nil
			node = node.next_node
		end
		@tail = node
		@tail.next_node = nil
	end

	def contains?(value)
		return true if @head.value == value
		node = @head
		while node.next_node != nil
			node = node.next_node
			return true if node.value == value
		end
		false
	end
	
	def find(value)
		return 0 if @head.value == value
		node = @head
		index = 0
		while node.next_node != nil
			node = node.next_node
			index += 1
			return index if node.value == value
		end
		nil
	end
	
	def to_s
		return "(#{@head.value}) -> nil" if @head.next_node == nil
		string = ""
		node = @head
		until node.next_node == nil
			string += "(#{node.value}) -> "
			node = node.next_node
		end
		string += "(#{node.value}) -> " + "nil"
	end	
end
