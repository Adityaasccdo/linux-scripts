#!/bin/bash
TASK_FILE=task.txt
show_menu(){
	echo "=========todo menu========="
	echo "1. Add Task"
 	echo "2. View Tasks"
  	echo "3. Remove Task"
  	echo "4. Exit"
  	echo "==========================="
}
add_task(){
	echo"Enter Your Task"
	read task
	echo "$task" >> "$TASK_FILE"
	echo "✅ task added"
}
view_task(){
	if [ -s "$TASK_FILE" ]; then
    		echo "📋 Your Tasks:"
    		nl -w2 "$TASK_FILE"
  	else
    		echo "🚫 No tasks found."
 	 fi
}
remove_task() {
  view_tasks
  echo "Enter task number to remove:"
  read num
  sed -i "${num}d" "$TASK_FILE"
  echo "❌ Task removed!"
}	
while true; do
  show_menu
  echo "Choose an option:"
  read choice
  case $choice in
    1) add_task ;;
    2) view_tasks ;;
    3) remove_task ;;
    4) echo "👋 Goodbye!" ; exit ;;
    *) echo "⚠️ Invalid option!" ;;
  esac
done
