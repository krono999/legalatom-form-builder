# LegalAtom Take-Home Test – Form Builder

Hi! Here's my Ruby form builder challenge.

### What I built
A simple form renderer that:
- Loads questionnaires from YAML files
- Handles dynamic visibility based on user responses (value checks and AND conditions)
- Prints everything to the terminal in plain text, closely matching the example format
- Supports all the required question types with presets where needed

### Decisions & trade-offs
- I focused on making the core flow solid and the code clean/easy to read.
- Implemented only the visibility conditions needed for the examples (ValueCheck + And).
- Skipped Or/Not conditions and the free-text "Other" option in checkboxes to stay within the time limit.
- No external gems, just plain Ruby.
- Kept the design object-oriented with small, focused classes.

### If I had more time
- Full support for Or/Not conditions
- Proper "Other" text input handling
- A few more unit tests
- Slightly nicer formatting

Overall, I'm happy with how it turned out – it's functional, readable, and easy to extend.

Thanks for the challenge and for being cool about using AI. It helped a ton with Ruby syntax (this was my first real Ruby project), but the architecture and choices are all mine.

Looking forward to your feedback!

Best,  
Nicolás Núñez

## How to run

```bash
ruby questionnaire.rb --config=config/personal_information.yaml,config/about_the_situation.yaml --responses=responses/user_response.yaml
