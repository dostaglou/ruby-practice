### Step 1
From the root directory in the terminal, run the following:
`ruby 00_intro_irb/main.rb`

Note that the output in the terminal is `Hello World`.

### Step 2
In your text editor, open the file at `00_intro_irb/main.rb`. This file is filled with 26 lines of code. Which line do you think produced the output in the console? Note that the `#` comments out a piece of code.

Answer: line 3 is responsible for the output. Lets test that in the next step.

### Step 3
Comment out line 3 by placing the `#` mark at the start of the line. Save the file and retry `ruby 00_intro_irb/main.rb`. There should be no output in the terminal.

### Step 4
Let's utilize the `hello_world` method this time. Re-open the main.rb file and remove the `#` marker, save, and re-run the file. Note that `Hello World` is now shown in the terminal again. Great! Let's re-comment out the Line 10 by restoring the `#` marker.

### Step 5
Let's look at Line 12's method `help_me_world` and Line 16's call to that method. Despite running the file several times, we have never seen `Thanks for helping!` in the console. Why do you think this is? Looking at other examples that have worked previously: Lines 3 and 7, they start with the keyword `puts`. Let's add that to the start of line 13 and re-run the file.

You should now have seen the thank you message. So let's return to the file and add a comment to `help_me_world` to prevent the method from being called again.

### Step 6
Similar to `help_me_world`, `personalized_hello` has never appeared in the display. The method exists but isn't being called. Let's fix this by un-commenting line 26. Re-running the terminal should display `What is your name?` and pause while waiting for you to type something into the terminal. In this case, let's type our name and hit enter. It should present you with a personalized greeting.

Line 22's `gets` method allows the program to seekout user input and store that input to a variable called `name`. That variable is later interpolated into the final string on line 23 that is shown in the terminal.

Let's re-comment out line 26 and move on.

### Step 7
Line 28 is the first time we have seen a method which accepts arguments. In this case, it accepts 1 argument called `name` which it later uses. This method is even called on line 32 and sets the `name` argument to "Dillon". However, we have never seen it displayed in the terminal. Let's fix that in a different way: add `puts` before the method call on line 32. Re-run the file and it should output `Howdy Howdy, Dillon`.

### Step 8 Challenge
Let's expand on what we have done so far. Can you change the name to your own? Can you try to pass it 2 arguments: first_name, last_name.

Give it a shot and when you think you have it working, comment out the original method call on line 32 and then run the following: `rspec 00_intro_irb/main_spec.rb`.

If all when well, it should return `1 example, 0 failures` in your terminal. If not, give it another shot. If you are stuck, feel free to the answer in the comments under the test.

### Step 9
If all the above has gone well, you can now try this in the IRB console. Type `irb` in the terminal. It should open an interactive console. Typing `2 + 2` in the console and hitting enter should execute some math and produce a return of `4`.

You can copy all the content of the `main.rb` file into the irb. It will execute the code line by line. After it has finished, you can then utilize the methods in that file simply by naming them. For example type `hello_world` into IRB and you will see `hello world` shown in terminal. Note that it will have the `hello world` and then another line `=> nil`. Why? Because the method `puts` natively returns `nil`. It will show something in terminal but the method itself returns something different.

Try `help_me_world` and the result should be different. You should get only 1 line and it will look like `=> "Thanks for helping!"` because the return on that method is the string, not the results of a `puts`.

You can exit the IRB by typing `quit` and enter.

### Step 10
Let's try the IRB one more time. This time we will load the file and not just copy-paste the content. Type `irb` in the terminal. Upon opening type `require_relative "00_intro_irb/main.rb"`. It should display the `Hello World` from the Line 3 puts and the `=> true`. The true in this case means that it was loaded successfully.

Now, just like in step 9, you can execute all the same methods in the file but without having to copy paste them. Give it a try with `personalized_hello`. Even in IRB it will give you a prompt to provide a name. When done exploring, merely type `quit`.
