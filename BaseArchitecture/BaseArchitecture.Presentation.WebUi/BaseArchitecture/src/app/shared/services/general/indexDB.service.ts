import { Injectable } from '@angular/core';
import { openDB, DBSchema, IDBPDatabase } from 'idb';

@Injectable({ providedIn: 'root' })
export class IndexdDBService {
  private db: IDBPDatabase<any>;

  constructor() {
    this.connectToDb();
  }

  async connectToDb() {
    this.db = await openDB<MyDB>('siscose-db', 1, {
      upgrade(db) {
        db.createObjectStore('user-store');
        db.createObjectStore('data-menu', {
          keyPath: 'codMenu',
          autoIncrement: true,
        });
        db.createObjectStore('save-store', {
          keyPath: 'id',
          autoIncrement: true,
        });
        db.createObjectStore('file-store', {
          keyPath: 'id',
          autoIncrement: true,
        });
        db.createObjectStore('data-store');
      },
    });
  }

  // addMenu(val: any) {
  //   return this.db.put('data-menu', val);
  // }

  addToken(val: any, key: string) {
    return this.db.put('user-store', val, key);
  }

  addData(val: any, key: string) {
    return this.db.put('data-store', val, key);
  }

  addStore(val: any) {
    return this.db.add('save-store', val);
  }

  addFile(val: any) {
    return this.db.add('file-store', val);
  }

  fetchData = (
    dbName: string,
    objectStoreName: string,
    KeyObjectSoreName: string
  ) => {
    return new Promise(function (resolve, reject) {
      var myDB = window.indexedDB.open(dbName);

      myDB.onsuccess = (event: any) => {
        event.currentTarget.result
          .transaction(objectStoreName)
          .objectStore(objectStoreName)
          .get(KeyObjectSoreName).onsuccess = (event) => {
          resolve(event.target.result);
        };
      };

      myDB.onerror = (err) => {
        reject(err);
      };
    });
  };

  fetchAllData = (
    dbName: string,
    objectStoreName: string
  ) => {
    return new Promise(function (resolve, reject) {
      var myDB = window.indexedDB.open(dbName);

      myDB.onsuccess = (event: any) => {
        event.currentTarget.result
          .transaction(objectStoreName)
          .objectStore(objectStoreName)
          .getAll().onsuccess = (event) => {
          resolve(event.target.result);
        };
      };

      myDB.onerror = (err) => {
        reject(err);
      };
    });
  };

  clearStore() {
    return new Promise<void>(function (resolve, reject) {
      var myDB = window.indexedDB.open('checkList-db');
      myDB.onsuccess = (event: any) => {
        event.currentTarget.result
          .transaction('user-store', 'readwrite')
          .objectStore('user-store')
          .clear();

        resolve();
      };

      myDB.onerror = (err) => {
        reject(err);
      };
    });
  }
}

interface MyDB extends DBSchema {
  'data-menu': {
    key: string;
    value: {
      codMenu: string;
      body: any;
    };
  };
  'user-store': {
    key: string;
    value: string;
  };
  'data-store': {
    key: string;
    value: string;
  };
  'save-store': {
    key: string;
    value: {
      id: number;
      body: any;
      url: string;
      formDataTxt: string;
    };
  };
  'file-store': {
    key: string;
    value: {
      id: number;
      body: any;
      url: string;
      formDataTxt: string;
    };
  };
}
