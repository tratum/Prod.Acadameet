// web/msal_config.js
const msalConfig = {
  auth: {
    clientId: "16d5719f-86d1-47a2-848d-e9f63d07a968",
    authority: "https://login.microsoftonline.com/organizations",
    redirectUri: "https://tratum.github.io/Acadameet/",
  },
  cache: {
    cacheLocation: "localStorage",
    storeAuthStateInCookie: true,
  },
};

const msalInstance = new msal.PublicClientApplication(msalConfig);

async function signIn() {
  try {
    const loginResponse = await msalInstance.loginPopup({
      scopes: ["User.Read","openid", "profile", "email", "offline_access"],
    });
    return loginResponse;
  } catch (error) {
    console.error(error);
  }
}

async function getToken() {
  const account = msalInstance.getAllAccounts()[0];
  if (!account) {
    throw new Error("No user account detected");
  }

  try {
    const response = await msalInstance.acquireTokenSilent({
      scopes: ["User.Read","openid", "profile", "email", "offline_access"],
      account: account,
    });
    return response.accessToken;
  } catch (error) {
    if (error instanceof msal.InteractionRequiredAuthError) {
      // Fallback to interaction when silent call fails
      return msalInstance.acquireTokenPopup({
        scopes: ["User.Read","openid", "profile", "email", "offline_access"],
      });
    } else {
      console.error(error);
    }
  }
}
