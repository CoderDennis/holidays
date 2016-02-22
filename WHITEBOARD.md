## Issues with macro implementation

- Because of compile time constraint, users of the library cannot add their own definitions at run time.
- Caching could be added to special days function, but is pattern matching that much faster than a cached lookup?
- No ability to specify which regions to load -- it's all or nothing.
- Code is hard to read and understand.
- Sometimes fails to compile properly.

## Process based solution ideas

- One process per region with some dictionary of available regions.
- Configuration setting for which regions to load plus run time ability to load new regions.
- Depends on caching for all values, not just special days.
- Just find all dates for the given year and cache those.
- Application must be started -- not just a library.
- Supervisor? Can processes created in separate applications be part of a single supervision tree? Or just pass a new module in to start child?
- Do new modules outside the application still need to `use` a Holidays definition macro module?
