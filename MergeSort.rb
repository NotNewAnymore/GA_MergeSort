#At this point I should consider making this it's own document or using someone else's gem(downloadable Ruby package/library) for this.
def generaterandoms(total)
  numbers = []
  i = 0
  while i < total
    numbers << Random.rand(10000)   # << appends to the end of an array. We don't need to make an object to use the random class, although if I wanted to use a specific seed, I could.
    i += 1
  end
  numbers
end

class Array
  #Merge sort requires all inputs to be comparable.
  #By default, uses self as an input, so an array can be sorted with array.mergeSort, but also mergeSort can sort an array. Maybe a little unneccesary, but it lets a programmer format their code in more ways.
  #Separates the list into parts, returns sorted list
  def mergeSort(aIn = self)
    if aIn.length <= 1 #Prevent infinite recurision
      return aIn
    end
    middle = aIn.length / 2 #Find the middle
    left = aIn.take(middle) #take will return the items before an index in the list
    right = aIn.drop(middle) #drop will return the items take would not
    left = left.mergeSort   #recurision to further split up lists
    right = right.mergeSort
    return merge(left, right)   #Sort lists with each other
  end

  #The hard part?
  #Takes two lists as input, must be entirely comparable
  #Combines the lists, and sorts them
  def merge(left, right)
    #Create result list, set indecies to 0
    result = []
    leftIndex = 0
    rightIndex = 0
    #Sort stuff. Loops until it reaches the end of either list
    while leftIndex < left.length and rightIndex < right.length
      if left[leftIndex] < right[rightIndex] #If the left index's object is smaller, append it to the result
        #print "Left"
        result << left[leftIndex]
        leftIndex += 1
      else #Otherwise, append the right object
        #print "Right"
        result << right[rightIndex]
        rightIndex += 1
      end
    end
    #Add remaining elements to result array
    result += left.drop(leftIndex)
    result += right.drop(rightIndex)
    result  #Return the result
  end
end

#This is effectively the Main method. If __FILE__ == $0 checks if this file is not being run by another ruby file. If this file is, we can assume it's being used as a library to get the merge sort and random array generation.
if __FILE__ == $0
  #Merge sort breaks a list down into smaller lists using recursion, and then sorts them by comparing the items in both lists.
  #Merge sort is more efficent than bubble sort because it will never have to move an item from one side of the list to the other, one position at a time.
  #I hear that it's time complexity is O(N * logN). This means it's efficency scales logarithmically with the length of a list,
  #so it's best for large data sets, and might be slower for very small ones.
  testArr = generaterandoms(25)
  puts "Unsorted array:"
  puts testArr.to_s
  puts "Sorted array:"
  puts testArr.mergeSort.to_s
end
