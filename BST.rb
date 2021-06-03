load "node.rb"

class Bst

	def initialize
		@head = nil
	end	

	def insert(value)
		if @head==nil
			@head = Node.new(value)
		else
			t = Node.new(value)

			temp = @head
			pre = nil

			while(temp)
				pre = temp
				if temp.value < value
					temp = temp.right
				else
					temp = temp.left
				end
			end


			if pre.value >= value
				pre.left = t
			else
				pre.right = t
			end
		end

	end

	def findMax
		prev = nil
		temp = @head

		while temp
			prev = temp
			temp = temp.right
		end

		prev.value
	end

	def findMin
		prev = nil
		temp = @head
		while temp
			prev = temp
			temp = temp.left
		end
		prev.value
	end

	def preordhelp(strt,arr)
		if strt
			arr.append(strt.value)
			preordhelp(strt.left,arr)
			preordhelp(strt.right,arr)
		end
	end

	def preorder
		arr = []
		preordhelp(@head,arr)
		arr
	end

	def inordhelp(strt,arr)
		if strt
			inordhelp(strt.left,arr)
			arr.append(strt.value)
			inordhelp(strt.right,arr)
		end
	end

	def inorder
		arr = []
		inordhelp(@head,arr)
		arr
	end

	def postordhelp(strt,arr)
		if strt
			postordhelp(strt.left,arr)
			postordhelp(strt.right,arr)
			arr.append(strt.value)
		end
	end

	def postorder
		arr = []
		postordhelp(@head,arr)
		arr
	end

	def levelorder
		arr = []
		que = Queue.new
		temp = @head
		while(temp)
			arr.append(temp.value)
			if temp.left
				que << (temp.left)
			end
			if temp.right
				que << (temp.right)
			end
			if que.size != 0
				temp = que.pop
			else
				temp = nil
			end
		end
		arr
	end

	def search(value)
		temp = @head
		flag = 0
		while temp
			if(temp.value == value)
				puts "Found"
				flag = 1
				break
			elsif temp.value > value
				temp = temp.left
			else
				temp = temp.right
			end				
		end
		unless flag==1
			puts "Not Found"	
		end
	end

	def findMinDel(temp, prev)
		if(temp.right==nil)
			if(temp.value>prev.value)
				prev.right = temp.left
			else
				prev.left = temp.left
			end
		else
			fmin = temp.right
			pre = nil
			while fmin.left
				pre = fmin
				fmin = fmin.left
			end
			if pre
				pre.left = nil

			else
				temp.right = nil
			end
			temp.value = fmin.value
		end
	end



	def delete(value)
		temp = @head
		flag = 0
		prev = nil
		while temp
			if(temp.value == value)
				if(temp.left==nil && temp.right==nil)
					if(temp.value>prev.value)
						prev.right = nil
					else
						prev.left = nil
					end

				else
					findMinDel(temp,prev)
				end
				flag = 1
				break
			elsif temp.value > value
				prev = temp
				temp = temp.left
			else
				prev = temp
				temp = temp.right
			end				
		end
		unless flag==1
			puts "Element not Found"	
		end
	end

	def printPath(arr)
		puts "A path:"
		arr.each{|n| puts n}		
	end

	def traversePaths(head,arr)
		if(head==nil)
			return
		end

		arr.append(head.value)

		if(head.right==nil && head.left==nil)
			printPath(arr)
		else
			traversePaths(head.left,arr)
			arr.pop()
			traversePaths(head.right,arr)
			arr.pop()
		end

	end

	def printAllPaths()
		arr = []
		traversePaths(@head,arr)
	end

	def extract(strt, file)
		if strt
			extract(strt.left,file)
			file.puts strt.value
			extract(strt.right,file)
		end

	end

	def saveToFile(file)
		extract(@head, file)		
	end

	def fromFile(name)
		file = File.open("data.txt","r")
		contents = file.read.split("\n")
		contents.each{|n| insert(n.to_i)}

	end
end


