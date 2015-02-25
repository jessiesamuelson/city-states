# City States

Today we are going to build a game. Not like Snake, or Duck Hunt, but an online multi-player game.

## Synopsis

You have just been elected ruler of your new-found country. Your populace have entrusted you to name
them, and rule them.

### Step 1: Building a Nation

First thing first, let's build a Player resource.  Players should have a name, a title (something like "King", "Duke" or "Pharaoh"), and login name (or email), and a password.

Players should be able to sign up and log in. (Hint: Use `BCrypt` and `has_secure_password`)

Once the player is logged in, the first thing on his agenda should be to found his country. Let's
create a Country model with a `name`, `player_id`, `flag`, `motto`, `population`, `employment`,
`tax_rate` and `wealth`.  `employment` should be a Float representing the percentage of our
population in the workforce

A collection of flags are available in the `city-states/flags` folder. *(Hint: Use `Dir['flags/*.png']` to get an `Array` of all the available flags)*

Add an `after_create` callback to the `Country` model that sets the `population` to a random value
between 0 and 100. (We start from humble beginnings after all)

The Player should be able to adjust the `employment` and `tax_rate` at will.

### Step 2: Secure your Nation

Don't allow other Players to make changes to our Country.  Also, ensure that nobody (not even the
owner of the Country) can modify the `population` and `wealth` fields of our `Country`.

We should ask the user to create a Country right after they sign up, or after they log in if they
haven't created a `Country` yet.  If they have, then send them to the `show` page for the Country.

### Step 3: Acquire Resources

Create a `Resource` model that contains a `name`, `growth_factor`, and `exchange_rate`.
`growth_factor` and `exchange_rate` should both be `Float`. Populate this table using the data
provided in `city-states/resources.csv`

Now create a `CountryResource` model with a `country_id`, `resource_id`, and `quantity` to act as
our JOIN table.

Next, set up the `has_many through` association on Country, and write an `after_create` callback on
our `Country` model that randomly selects 3-6 `Resource` records and assigns to the `Country`.

### Step 4: Step by Step

Now we need a `Rake` task that we can run periodically to apply the effects of our Resources onto
our population.  We can name it `country:work`.  Our resources should effect our population, 
increasing it by the combined resources `growth_factor` times `employment`.

Accidents happen, so let's also decrease the population by a random percentage (between 0-5%) of our
employment.

Lastly, we need to collect taxes. Increase the countries `wealth` by multiplying the specialist population (`population` * (1-`employment`)) by `tax_rate`.

### Step 5: Trade

Congratulations on getting this far! At this point you have a semi-functioning game! Pat yourself on
the back!

Lets allow countries to trade with each other, exchanging `wealth` for `resources`.
Create a `TradeDeal` resource containing `player_id`, `country_resource_id`, `cost`, `quantity`,
and `agreed`. `quantity` should be a `Float` and `agreed` should be a `Boolean`.

We need an interface to allow Players to request a `TradeDeal` with other players. Trade deals
will only go into effect if they are `agreed`, and only the owner of the `CountryResource` should
be able to update `TradeDeal`'s `agreed` value, while either party can `destroy` the deal.

In the TradeDealsController, lets setup the `index` action to show all of the Trade Deals that a
Player can accept. We should add a button to 'Accept', or 'Deny' each one.  We can hook these
up to the `update` action, and restrict it so only the owner of the resource can update a TradeDeal.

Finally, we need to modify our `country:work` Rake task to subtract from the wealth of the country
the cost of the `TradeDeal` and apply the `growth_factor` to our population with a 10% overhead.

### Step 6: Get Creative!

Lets add some flair to our project.  Style the forms and layout.  Add Ajax to our
`trade_deals#index` action that updates our Pending and Active TradeDeals list whenever 'Accept' or
'Reject' is pressed.

Balance the game, by experimenting with it and making adjustments to the growth factors of our
resources. Consider adding your own elements to the game.
