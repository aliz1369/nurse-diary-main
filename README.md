# Nurse Diary
Develop a digital companion targeted to nurses. The digital tool should let them work with their personal tasks.

# Requirements

- Nurses should be able to see the tasks for the target day, tasks prior to that date and later than that date**
- It is possible to distinguish visually the tasks
- Nurses should be able to mark tasks as completed*

*For simplicity, this can be performed in-memory.
**For the target date you can consider August 23rd, which is the `deadline` field of the task


## Technical Details

- Use Flutter to implement your solution
- No requirement about the target, you can decide whether to support app, web, desktop or all of them

## Endpoints
There are a couple of endpoints to help getting started with the development.

- `GET /categories`
- `GET /tasks`

These can be reached at https://k7ap1irwai.api.quickmocker.com/ (e.g. https://k7ap1irwai.api.quickmocker.com/tasks).
