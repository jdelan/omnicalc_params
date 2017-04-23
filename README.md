# Omnicalc `params`

Dynamic web applications are more interesting than static websites for one reason: **user input.** Let's finally learn how to let our users give us input!

Your goal will be to build a simplified version of Omnicalc.

### [Here is the target you will ultimately build.](https://omnicalc-params.herokuapp.com/)

## Project Specific Setup

 1. Fork and clone as usual.
 1. `cd` into the folder you downloaded.
 1. `bundle install` (or `bundle` for short)
 1. `rails server` (or `rails s` for short)
 1. Navigate to [http://localhost:3000](http://localhost:3000) in Chrome — there's nothing there but the default Rails welcome screen!
 1. **This is a brand new, untouched Rails application.** All we've done is run the command `rails new omnicalc_params` to generate the basic structure of folders and files you see in your editor's sidebar, and we've added the instructions you're reading in this README.

    **You could generate a brand new Rails app yourself right now by doing the same thing:**

    1. Open a terminal window and `cd` to the folder where you store your code.
    1. `rails new your_own_app_name`
    1. `cd your_own_app_name`
    1. `rails s`

    That's it! You'd then see the same welcome screen at [http://localhost:3000](http://localhost:3000), and you would be ready to start building out your Rails app.

## Standard Workflow

 1. Fork to your own account.
 1. Clone to your computer.
 1. In the GitHub Desktop app, [create a branch for your work](https://help.github.com/desktop/guides/contributing/creating-a-branch-for-your-work/#creating-a-branch).
 1. Open the entire folder you downloaded in Atom.
 1. Make your first change to the code. (You could modify this README.md file by adding your username next to the project in the heading, for example.)
 1. In the GitHub Desktop app, create a commit. You *must* type a "summary"; "description" is optional.
 1. Click Publish. Verify that your branch is now visible on your fork at GitHub.com in the "Branch" dropdown.
 1. **Commit and Sync often as you work.**
 1. Make new branches freely to experiment. You can always switch back to an older branch and start over. **When in doubt, create a branch**, _especially_ before starting on a new task.
 1. If you have a question about your code, a great way to get feedback is to open a [Pull Request](https://help.github.com/articles/creating-a-pull-request/). After creating it, if you include the URL of your Pull Request when you post your question, reviewers will be able to easily see the changes you've made and leave comments on each line of your code with suggestions.

## Part I: Flexible Routes

The way it should work is:

 - If I visit a URL of the pattern

    ```
    /flexible/square/:number
    ```

    I should see the square of the number in the third segment of the path.

 - If I visit a URL of the pattern

   ```
   /flexible/square_root/:number
   ```

   I should see the square root of the number in the third segment of the path.

 - If I visit a URL of the pattern

   ```
   /flexible/payment/:basis_points/:number_of_years/:present_value
   ```

   I should see the **monthly** payment due, assuming that

   - the number in the third segment of the path is an _annual_ interest rate _in basis points_, or hundredths of a percent
   - the number in the fourth segment of the path is the number of _years_ remaining
   - the number in the fifth segment of the path is the present value

        ![Payment formula](payment_formula.gif?raw=true "Payment formula")

 - If I visit a URL of the pattern

   ```
   /flexible/random/:min/:max
   ```

   I should see a random number that falls between the numbers in the third and fourth segments of the path.

### Examples

 - If I visit [http://localhost:3000/flexible/square/5](http://localhost:3000/flexible/square/5), I should see something like

    > ## Flexible Square
    >
    > The square of 5 is 25.

 - If I visit [http://localhost:3000/flexible/square_root/8](http://localhost:3000/flexible/square_root/8), I should see something like

    > ## Flexible Square Root
    >
    > The square root of 8.0 is 2.83.

 - If I visit [http://localhost:3000/flexible/payment/410/30/250000](http://localhost:3000/flexible/payment/410/30/250000), I should see something like

    > ## Flexible Payment
    >
    > A 30 year loan of $250,000, with an annual interest rate of 4.10%, requires a monthly payment of $1,208.00.

 - If I visit [http://localhost:3000/flexible/random/50/100](http://localhost:3000/flexible/random/50/100), I should see something like

    > ## Flexible Random Number
    >
    > A random number between 50 and 100 is 87.

**All of these should work no matter what integers I type into the flexible segments of the path.**

Remember:

 - **Rails places all user input in the `params` hash.**
 - You can use the `params` hash in your actions or your views.
 - Watch the server log to see what the `params` hash contains for any given request.

#### Your task: Build out flexible RCAVs so that all of these (infinitely many) URLs work.

## Part II: Forms

Now, let's build something a little more realistic. **We don't want to type input into the address bar; we want to type into forms!**

The way it should work is:

 - If I visit the URL [http://localhost:3000/square/new](http://localhost:3000/square/new), I should see a form with a label and an input to enter a number. (Since we're no longer typing into the address bar, we can use decimals and are no longer limited to integers. Yay!)
    - If I submit that form, I should see the square of the number that I entered.
 - If I visit the URL [http://localhost:3000/square_root/new](http://localhost:3000/square_root/new), I should see a form with a label and an input to enter a number.
    - If I submit that form, I should see the square root of the number that I entered.
 - If I visit the URL [http://localhost:3000/payment/new](http://localhost:3000/payment/new), I should see a form with labels and inputs to enter three values:
    - An APR (annual percentage rate). (Since our users are no longer limited to integers, we can avoid thinking in basis points. Phew!)
    - A number of _years_ remaining
    - The principal
    - If I submit that form, I should see the **monthly** payment due given the values that I entered.
 - If I visit the URL [http://localhost:3000/random/new](http://localhost:3000/random/new), I should see a form with labels and inputs to enter two numbers, a minimum and a maximum.
    - If I submit that form, I should see a random number that falls between the numbers that I entered.
 - On the random number results page, add a link to _instantly_ re-calculate a new random number _from within the same range_, **without the user having to re-enter the minimum and maximum into the form again**.

## Part III: More Practice

 - Add a link to each results page to go back and perform a new calculation.
 - Add global navigation to get from calculator to calculator.
 - Implement the following calculators (without any styling, just functionality):
    - [Word Count](http://omnicalc-target.herokuapp.com/word_count/new)
    - [Descriptive Statistics](http://omnicalc-target.herokuapp.com/descriptive_statistics/new)

## Optional challenges

 - [Bootstrap it](http://getbootstrap.com/components/#panels) to make it look like [the real Omnicalc](http://omnicalc-target.herokuapp.com/). We've already connected `bootstrap.css` and [Font Awesome](http://fontawesome.io/icons/) for you, so you can just start using them.
