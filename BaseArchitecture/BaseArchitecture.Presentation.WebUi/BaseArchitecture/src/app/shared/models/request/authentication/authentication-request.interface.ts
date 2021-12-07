export class LoginRequest {
    // IdToken: string;
    // AccessToken: string;
    // ExpiresIn: string;
    // Device: string;
    Code: string;
    Header: string;
  }  

  export class LoginModel {
    AwsClientId: string;
    AwsClientSecret: string;
    AwsDomain: string;
    AwsUrlCallback: string;
    AwsIdentityPool: string;
    RefreshToken:string;
  }