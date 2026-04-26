// Module Federation across StreamVault frontends (storefront / admin / partner / mobile-web)
const { ModuleFederationPlugin } = require("@module-federation/enhanced/webpack");
module.exports = {
  plugins: [
    new ModuleFederationPlugin({
      name: "streamvault_shell",
      remotes: {
        admin: "admin@https://admin.streamvault.internal/remoteEntry.js",
        partner: "partner@https://partner.streamvault.internal/remoteEntry.js",
      },
      shared: { react: { singleton: true }, "react-dom": { singleton: true } },
    }),
  ],
};
