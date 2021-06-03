load "node.rb"

class LinkedList < Node
	def initialize
		@head = nil
	end

	def add(value)
		t = Node.new(value)
		if @head==nil
			@head = t
		else
			temp = @head
			while(temp.left)
				temp = temp.left
			end
			temp.left = t
		end			
	end

	def search(val)
		temp=@head
		while(temp)
			if temp.value == val
				puts "Found the Element"
				return
			end
			temp = temp.left
		end
		puts "Element not found"
	end

	def delete(val)
		if(@head.value==val)
			@head = @head.left
			return
		end

		temp = @head
		pre = nil
		while(temp)
			if temp.value == val
				pre.left = temp.left
				return
			end
			pre = temp
			temp = temp.left
		end
		puts "Element not found"	
	end

	def reverse
		prev = nil
		current = @head
		nxt = nil
		while(current)
			nxt = current.left
			current.left = prev
			prev = current
			current = nxt
		end
		@head = prev
	end

	def print
		temp = @head
		while(temp)
			puts temp.value
			temp = temp.left
		end
	end
end

