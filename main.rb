load "node.rb"
load "BST.rb"
load "linked_list.rb"

puts "Select a Data Structure"
puts "0. Quit"
puts "1. Linked List"
puts "2. Binary Search Tree"
choice = gets.to_i

case choice
when 0
	puts "Bye Bye"

when 1
	q = -2
  list = LinkedList.new()

  until q==0

    puts "Set of operations you can perform:"
    puts "0. Quit"
    puts "1. Insert"
    puts "2. Print all the elements."
    puts "3. Search for an element."
    puts "4. Delete an element."
		puts "5. Reverse the linked list"
		
		q = gets.to_i

		case q
		when 0
			puts "Thanks for trying it out"
			break

		when 1
			value = gets.to_i
			list.add(value)

		when 2
			list.print

		when 3
			value = gets.to_i
			list.search(value)
			
		when 4
			value = gets.to_i
			list.delete(value)

		when 5
			list.reverse

		else
			puts "Invalid input, please try again."
		end
	end	

when 2
	q = -2
	tree = Bst.new()

	until q==0

		puts "Set of operations you can perform:"
		puts "0. Quit"
		puts "1. Insert"
		puts "2. Find maximum element in the tree."
		puts "3. Find minimum element in the tree."
		puts "4. Traverse the tree in Pre-order format."
		puts "5. Traverse the tree in In-order format."
		puts "6. Traverse the tree in Post-order format."
		puts "7. Traverse the tree in Level-order format."
		puts "8. Search for an element."
		puts "9. Delete an element."
		puts "10. Print all the path from root to all the leaves."
		puts "11. Make tree from the file."

		q = gets.to_i

		case q

		when 0
			file = File.open(name, "a")
			tree.saveToFile(file)
			puts "All elements are saved to a file named data.txt."
			break
		when 1
			value  = gets.to_i
			tree.insert(value)

		when 2
			puts tree.findMax

		when 3
			puts tree.findMin

		when 4
			puts tree.preorder

		when 5
			puts tree.inorder

		when 6
			puts tree.postorder

		when 7
			puts tree.levelorder

		when 8
			value = gets.to_i
			tree.search(value)

		when 9
			value = gets.to_i
			tree.delete(value)
			puts "The element #{value} has been deleted from the BST."

		when 10
			tree.printAllPaths

		when 11
			puts "Enter file name"
			name = gets.chomp
			tree.fromFile(name)

		else
			puts "Thanks for trying it out"
			break
		end
	end
end
