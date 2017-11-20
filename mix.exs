defmodule NervesSystemRpi3.Mixfile do
  use Mix.Project

  @app :nerves_system_rpi3
  @version Path.join(__DIR__, "VERSION")
           |> File.read!()
           |> String.trim()

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.4",
      compilers: Mix.compilers() ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]
    ]
  end

  def application do
    []
  end

  def nerves_package do
    [
      type: :system,
      version: @version,
      compiler: :nerves_package,
      artifact_url: [
        "https://github.com/nerves-project/#{@app}/releases/download/v#{@version}/#{@app}-v#{@version}.tar.gz",
      ],
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig",
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 0.8", runtime: false},
      {:nerves_system_br, "~> 0.15.0", runtime: false, app: false},
      {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 0.12.0", runtime: false, app: false}
    ]
  end

  defp description do
    """
    Nerves System - Raspberry Pi 3 B
    """
  end

  defp package do
    [
      maintainers: ["Frank Hunleth", "Justin Schneck"],
      files: package_files(),
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/nerves-project/#{@app}"}
    ]
  end

  defp package_files do
    [
      "LICENSE",
      "mix.exs",
      "nerves_defconfig",
      "README.md",
      "VERSION",
      "rootfs_overlay",
      "fwup.conf",
      "cmdline.txt",
      "linux-4.4.defconfig",
      "config.txt",
      "post-createfs.sh"
    ]
  end
end
