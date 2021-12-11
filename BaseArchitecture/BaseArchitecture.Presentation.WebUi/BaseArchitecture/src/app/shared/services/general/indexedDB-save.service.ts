import { Injectable } from '@angular/core';
import { IndexdDBService } from './indexDB.service';
import { DBName, ObjectStoreName } from '../../constant';
import { SignOff, dataURLtoFile, decrypt, SetError } from '../../util';
import { LocalService } from './local.service';
import { ToastrService } from 'ngx-toastr';
import { StorageService } from './storage.service';
import { environment } from 'src/environments/environment';

declare var fileS3: any;

@Injectable({ providedIn: 'root' })
export class IndexedDBSaveService {
  private tokenChecklistOffline: any;
  private userChecklistOffline: any;
  private responseDataChecklist: any;
  j: number;

  constructor(
    private oIndexedDBService: IndexdDBService,
    private localStorageS: LocalService,
    private toastr: ToastrService,
    private storageService: StorageService,
    ) {}

  obtenerIndexedDB = async () => {
      debugger
    var _this = this;
    this.fetchHeader().then((responseHeader: any) => {
      _this.tokenChecklistOffline = responseHeader[0];
      _this.userChecklistOffline = JSON.parse(decrypt(responseHeader[1]));

      _this.oIndexedDBService
        .fetchAllData(DBName.siscose, ObjectStoreName.saveStore)
        .then((responseData: any) => {
          if (responseData.length > 0) {
              debugger
            _this.responseDataChecklist = responseData;
            _this.sendData();
          } else {
            _this.oIndexedDBService
              .fetchAllData(DBName.siscose, ObjectStoreName.fileStore)
              .then((responseFile: any) => {
                if (responseFile.length > 0) {
                  _this.responseDataChecklist = responseFile;
                  return _this.sendFile();
                }
              });
          }
        });
    });
  };

  private fetchHeader = () => {
    return new Promise(function (resolve, reject) {
      var myDB = window.indexedDB.open(DBName.siscose);

      myDB.onsuccess = (event: any) => {
        event.currentTarget.result
          .transaction(ObjectStoreName.userStore)
          .objectStore(ObjectStoreName.userStore)
          .getAll().onsuccess = (event: any) => {
          resolve(event.target.result);
        };
      };

      myDB.onerror = (err) => {
        reject(err);
      };
    });
  };

  private sendData = () => {
    var _this = this;
    _this.j = 0;

    for (let index = 0; index < _this.responseDataChecklist.length; index++) {
      let bodyTemp = decrypt(_this.responseDataChecklist[index].body);
      let arrayBody = JSON.parse(bodyTemp);
      if(arrayBody.ListAnswerChecklistRequest != undefined)
      {
        arrayBody.ListAnswerChecklistRequest
        .forEach((element) => {
          element.ListAnswerActionChecklistRequest.forEach(e => {
              e.ListAnswerActionFileChecklistRequest.forEach(elementFile => {
                var params = fileS3.ParamsBucket(
                  environment.BucketSite,
                  elementFile.AttachedFile.PathFile,
                  dataURLtoFile(elementFile.AttachedFile.FileBase64, elementFile.AttachedFile.Name)
                );
        
                fileS3.UploadS3(params, (err, data) => {
                  if (err) {
                    _this.toastr.error('Credenciales expirada, cerrando sesión');
                    console.log(err);
                    SetError();
                    SignOff();
                    return false;
                  } else return true;
                });
              });
          });
        });
      }
      else
      {        
        //bodyTemp=arrayBody;
        arrayBody.ListAnswerActionFileChecklistRequest
        .forEach((element) => {
          if(element.AttachedFile.FileBase64 != undefined)
          {          
            var params = fileS3.ParamsBucket(
              environment.BucketSite,
              element.AttachedFile.Name,
              dataURLtoFile(element.AttachedFile.FileBase64, element.AttachedFile.Name)
            );
    
            fileS3.UploadS3(params, (err, data) => {
              if(navigator.onLine)
              {
                if (err) {
                  _this.toastr.error('Credenciales expirada, cerrando sesión');
                  console.log(err);
                  SetError();
                  // SignOff();
                  return false;
                } else return true;
              }
            });
          }
        });
      }


      let userControlCard = this.localStorageS.getJsonValue('userChecklist');
      userControlCard.AccessDevice = '0';
      const user = this.storageService.secureStorage.encrypt(
        JSON.stringify(userControlCard)
      );


      window
        .fetch(_this.responseDataChecklist[index].url, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            Header: user,
            Code: JSON.parse(localStorage.getItem('loginChecklist')).Code,
          },
          body: bodyTemp,
        })
        .then((e) => {
          if (e.status === 200) {
            _this.clearData(
              _this.responseDataChecklist[index].id,
              ObjectStoreName.saveStore
            );
            _this.j++;
          }
        })
        .catch(function (err) {
          console.log(err);
        });
    }
  };

  private sendFile = () => {
    var _this = this;
    _this.j = 0;
    for (let index = 0; index < _this.responseDataChecklist.length; index++) {
      var formData = new FormData();
      let fileTemp = decrypt(_this.responseDataChecklist[index].body);
      window
        .fetch(_this.responseDataChecklist[index].url, {
          method: 'POST',
          headers: {
            Accept: 'application/json',
            Authorization: _this.tokenChecklistOffline,
            UserEdit: _this.userChecklistOffline.UserEdit.replace(/['"]+/g, ''),
            User: _this.userChecklistOffline.User.replace(/['"]+/g, ''),
            AccessDevice: '0',
            AwsSessionToken: _this.userChecklistOffline.AwsSessionToken.replace(
              /['"]+/g,
              ''
            ),
            AwsAccessKey: _this.userChecklistOffline.AwsAccessKey.replace(
              /['"]+/g,
              ''
            ),
            AwsSecretKey: _this.userChecklistOffline.AwsSecretKey.replace(
              /['"]+/g,
              ''
            ),
          },
          body: fileTemp,
        })
        .then((e) => {
          if (e.status === 200) {
            _this.clearData(
              _this.responseDataChecklist[index].id,
              ObjectStoreName.fileStore
            );
          }
        })
        .catch(function (err) {
          console.log(err);
        });
    }
  };

  private clearData = (id: any, objectStoreName: string) => {
    var _this = this;

    return new Promise<void>(function (resolve, reject) {
      var myDB = window.indexedDB.open(DBName.siscose);
      myDB.onsuccess = (event: any) => {
        event.currentTarget.result
          .transaction(objectStoreName, 'readwrite')
          .objectStore(objectStoreName)
          .delete(id);

        if (_this.j === _this.responseDataChecklist.length) {
          _this.j = 0;
          _this.oIndexedDBService
            .fetchAllData(DBName.siscose, ObjectStoreName.fileStore)
            .then((responseFile: any) => {
              if (responseFile.length > 0) {
                _this.responseDataChecklist = responseFile;
                return _this.sendFile();
              }
            });
        }

        resolve();
      };

      myDB.onerror = (err) => {
        reject(err);
      };
    });
  };
}
