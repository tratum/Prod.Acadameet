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

const loginRequest = {
  scopes: ["User.Read","openid", "profile", "email", "offline_access"]
};

const tokenRequest = {
  scopes: ["User.Read","openid", "profile", "email", "offline_access"]
};

window.signIn = async function () {
  try {
    const loginResponse = await msalInstance.loginPopup(loginRequest);
    console.log('id_token acquired at: ' + new Date().toString());
    console.log(loginResponse);
    return loginResponse;
  } catch (error) {
    console.error(error);
  }
}

window.getToken = async function () {
  const account = msalInstance.getAllAccounts()[0];
  if (!account) {
    throw new Error("No user account detected");
  }

  try {
    const response = await msalInstance.acquireTokenSilent({
      scopes: tokenRequest.scopes,
      account: account,
    });
    return response.accessToken;
  } catch (error) {
    if (error instanceof msal.InteractionRequiredAuthError) {
      // Fallback to interaction when silent call fails
      return msalInstance.acquireTokenPopup(tokenRequest);
    } else {
      console.error(error);
    }
  }
}
