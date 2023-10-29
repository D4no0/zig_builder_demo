# ZigBuilderDemo
`ZigBuilderDemo` is a demonstration project showcasing the powerful capabilities of the `ZigBuilder` library. Intended for both beginners and experienced developers, this project provides a hands-on approach to integrating the Zig compiler seamlessly into Elixir projects.

By exploring `ZigBuilderDemo`, users can witness firsthand how `ZigBuilder` replaces cmake in the build process, simplifying the setup and execution of Zig within the Elixir ecosystem. It serves as a practical guide, illustrating various use-cases, patterns, and best practices associated with the `ZigBuilder` library.

Whether you're looking to dive deep into Zig's efficiency or want to streamline your Elixir project's build process, `ZigBuilderDemo` offers valuable insights and a ready-to-run example to kickstart your journey.

## Getting Started with ZigBuilder


To start Demo project, follow these steps:

#### 1. Clone demo project
```bash
git clone https://github.com/D4no0/zig_builder_demo
```
#### 2. Install Dependencies

Run the following command to fetch your project dependencies, including `zig_builder`
```bash
$ mix deps.get
```
#### 3. Compile zig_builder

Run the following command to compile `zig_builder` using mix task
```bash
$ mix zig_builder.compile
```
#### 4. Compile zig_builder

Run the following command to start demo project
```bash
$ iex -S mix
```

#### 5. Compile zig_builder

Run the following command to test nif
```elixir
Nif.sum 11, 2 
``` 