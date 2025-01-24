import Foundation

// Habit;Period;Streak
var habitData = """
Brush Teeth;Morning;0
Make Bed;Morning;0
Gym;Morning;0
Protein Intake;Morning;0
Breakfast;Morning;0
Cold Shower;Morning;0
Prayer;Morning;0
Meditation;Afternoon;0
Gratitude Text;Afternoon;0
Program 1 Hour;Afternoon;0
Hot Shower;Evening;0
Bedtime Meditation;Evening;0
"""

// HabitItem class to represent each habit item
class HabitItem: CustomStringConvertible {
  let id: Int
  let habit: String
  let period: String
  let streak: String

  // Initializer to create a HabitItem
  init(id: Int, habit: String, period: String, streak: String) {
    self.id = id
    self.habit = habit
    self.period = period
    self.streak = streak
  }

  // Custom description for printing the HabitItem
  var description: String {
      return "ID: \(id), Habit: \(habit), Period: \(period), Streak: \(streak)"
  }
}

// HabitManager class to manage a collection of HabitItem
class HabitManager {
  private var habit: [HabitItem]

  // Initializes the manager with a list of HabitItems
  init(data: [HabitItem]) {
    self.habit = data
  }

  // Retrieve a HabitItem by index
  func getItem(byIndex index: Int) -> HabitItem? {
    return self.habit.first(where: { $0.id == index })
  }

  // Retrieve a HabitItem by ID
  func getItem(byId id: Int) -> HabitItem? {
    return self.habit.first { $0.id == id }
  }

  // Add a new HabitItem to the manager
  func addItem(_ item: HabitItem) {
    self.habit.append(item)
  }

  // Delete a HabitItem by ID
  func deleteItem(byId id: Int) -> Bool {
    if let delItem = self.habit.firstIndex(where: { $0.id == id }) {
        self.habit.remove(at: delItem)
        return true
    } else {
        return false
    }
  }

  // Print all HabitItems in the manager
  func printAll() {
    for hab in self.habit {
        print(hab)
    }
  }
}

// Function to parse the habit data string and create HabitItem instances
func driverFunc(habitData: String) -> [HabitItem] {
  var list = [HabitItem]()
  let dataLines = habitData.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: "\n")
  
  // Loop through each line of data and create a HabitItem
  for (index, line) in dataLines.enumerated() {
    let splitData = line.split(separator: ";")
    
    let habitList = HabitItem(
      id: index + 1,
      habit: String(splitData[0]),
      period: String(splitData[1]),
      streak: String(splitData[2])
    )
    
    // Print each HabitItem as it's created
    print(habitList)
    list.append(habitList)
  }
  
  return list
}

// ------------------------ HabitItem & Driver Function ------------------------

print("------------------------ HabitItem & Driver Function ------------------------")
// Use the driver function to create a list of HabitItems from the habit data string
// Prints all the created HabitItems
var habitList = driverFunc(habitData: habitData)
//OUTPUT
// ID: 1, Habit: Brush Teeth, Period: Morning, Streak: 0
// ID: 2, Habit: Make Bed, Period: Morning, Streak: 0
// ID: 3, Habit: Gym, Period: Morning, Streak: 0
// ID: 4, Habit: Protein Intake, Period: Morning, Streak: 0
// ID: 5, Habit: Breakfast, Period: Morning, Streak: 0
// ID: 6, Habit: Cold Shower, Period: Morning, Streak: 0
// ID: 7, Habit: Prayer, Period: Morning, Streak: 0
// ID: 8, Habit: Meditation, Period: Afternoon, Streak: 0
// ID: 9, Habit: Gratitude Text, Period: Afternoon, Streak: 0
// ID: 10, Habit: Program 1 Hour, Period: Afternoon, Streak: 0
// ID: 11, Habit: Hot Shower, Period: Evening, Streak: 0
// ID: 12, Habit: Bedtime Meditation, Period: Evening, Streak: 0

// ------------------------ HabitManager Methods ------------------------

print("-------- HabitManager Methods Test --------\n")
var testManager = HabitManager(data: habitList)

// Get the item by index and print it
var foundItem = testManager.getItem(byIndex: 3)
if let printedItem = foundItem {
  print(printedItem)
} else {
  print("Could not find item by index")
}
//OUTPUT: ID: 3, Habit: Gym, Period: Morning, Streak: 0

// Try to get an item that doesn't exist by index and handle the case
var notFoundItem = testManager.getItem(byIndex: 30)
if let printedItem = notFoundItem {
  print(printedItem)
} else {
  print("Could not find item by index")
}
//OUTPUT: Could not find item by index

// Get the item by ID and print it
var foundItemById = testManager.getItem(byId: 5)
if let printedItemById = foundItemById {
  print(printedItemById)
} else {
  print("Could not find item by ID")
}
//OUTPUT: ID: 5, Habit: Breakfast, Period: Morning, Streak: 0

// Try to get an item that doesn't exist by ID and handle the case
var notFoundItemById = testManager.getItem(byId: 50)
if let printedNotId = notFoundItemById {
  print(printedNotId)
} else {
  print("Could not find item by ID")
}
//OUTPUT: Could not find item by ID

// Add a new item to the HabitManager
let newItem = HabitItem(id: 20, habit: "service", period: "afternoon", streak: "2")
testManager.addItem(newItem)
// Retrieve and print the newly added item by its ID
var newItemPrint = testManager.getItem(byId: 20)
print(newItemPrint ?? "Could not find new item")
//OUTPUT: ID: 20, Habit: service, Period: afternoon, Streak: 2


// Delete an item by its ID and print the result (whether it was deleted or not)
let deletedItem = testManager.deleteItem(byId: 1)
print(deletedItem ? "Item deleted" : "Could not find item")
//OUTPUT: Item deleted

// Test the printAll() method to print all the remaining items in the manager
testManager.printAll()
//OUTPUT
// ID: 2, Habit: Make Bed, Period: Morning, Streak: 0
// ID: 3, Habit: Gym, Period: Morning, Streak: 0
// ID: 4, Habit: Protein Intake, Period: Morning, Streak: 0
// ID: 5, Habit: Breakfast, Period: Morning, Streak: 0
// ID: 6, Habit: Cold Shower, Period: Morning, Streak: 0
// ID: 7, Habit: Prayer, Period: Morning, Streak: 0
// ID: 8, Habit: Meditation, Period: Afternoon, Streak: 0
// ID: 9, Habit: Gratitude Text, Period: Afternoon, Streak: 0
// ID: 10, Habit: Program 1 Hour, Period: Afternoon, Streak: 0
// ID: 11, Habit: Hot Shower, Period: Evening, Streak: 0
// ID: 12, Habit: Bedtime Meditation, Period: Evening, Streak: 0
// ID: 20, Habit: service, Period: afternoon, Streak: 2