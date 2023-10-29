const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const erts_dir = std.process.getEnvVarOwned(allocator, "ERTS_INCLUDE_DIR") catch "";
    const flag = "-I";

    // Allocate memory for the concatenated string
    var concatenated = try allocator.alloc(u8, erts_dir.len + flag.len);

    // Copy the first string into the allocated memory
    try std.mem.copy(u8, concatenated, erts_dir, erts_dir.len);

    // Copy the second string into the allocated memory
    try std.mem.copy(u8, concatenated + erts_dir.len, flag, flag.len);

    const result = concatenated[0 .. erts_dir.len + flag.len];

    const lib = b.addSharedLibrary(.{
        .name = "nif",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .target = target,
        .optimize = optimize,
        .use_lld = false,
    });
    lib.addCSourceFile(.{ .file = .{ .path = "c_src/nif.c" }, .flags = &.{result} });

    // MacOS specific flag
    lib.linker_allow_shlib_undefined = true;

    // This declares intent for the library to be installed into the standard
    // location when the user invokes the "install" step (the default step when
    // running `zig build`).
    b.installArtifact(lib);
}

fn concatAndReturnBuffer(allocator: *std.mem.Allocator, one: []const u8, two: []const u8) !std.RingBuffer {
    var b = try std.RingBuffer.init(allocator, one);
    try b.append(two);
    return b;
}
