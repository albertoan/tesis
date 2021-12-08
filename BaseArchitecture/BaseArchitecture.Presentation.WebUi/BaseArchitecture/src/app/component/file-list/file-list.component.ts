import { Component, Input, OnInit } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { Base64toBlob, dataURLtoFile, DownloadFileS3 } from 'src/app/shared/util';
import { environment } from 'src/environments/environment';

declare var fileS3: any;

@Component({
  selector: 'app-file-list',
  templateUrl: './file-list.component.html',
  styleUrls: ['./file-list.component.css'],
})
export class FileListComponent implements OnInit {
  @Input() fileList: any;
  @Input() typeView: boolean = false;
  @Input() typeDelete?: boolean;

  constructor(private spinner: NgxSpinnerService) {}

  ngOnInit() {}

  downloadFile = (item: any) => {    
    if(item.AttachedFile.FileBase64 != undefined)
    {
      var reader = new FileReader();
      reader=item.AttachedFile.FileBase64 ;
      var descarga = dataURLtoFile(item.AttachedFile.FileBase64, item.AttachedFile.Name);
      // let blob = Base64toBlob(data.Value, MediaType.ExcelContentType);
         const link = document.createElement('a');
        const objectUrl = URL.createObjectURL(descarga);
        link.href = objectUrl;
        link.download = item.AttachedFile.Name;
        link.click();
        URL.revokeObjectURL(objectUrl);
        this.spinner.hide();
      // this.saveByteArray(item.AttachedFile.Name,item.AttachedFile.FileBase64);
    }
    else
    {
      DownloadFileS3(item.AttachedFile.PathFile, item.AttachedFile.Name);
    }


  };

  

  saveByteArray(reportName, byte) {
    var blob = new Blob([byte], {type: "application/pdf"});
    var link = document.createElement('a');
    link.href = window.URL.createObjectURL(blob);
    var fileName = reportName;
    link.download = fileName;
    link.click();
};

  
   base64ToArrayBuffer(base64) {​​​
    var binaryString = window.atob(base64);
    var binaryLen = binaryString.length;
    var bytes = new Uint8Array(binaryLen);
    for (var i = 0; i < binaryLen; i++) {​​​
       var ascii = binaryString.charCodeAt(i);
       bytes[i] = ascii;
    }​​​
    return bytes;
 }​​​


  deleteFile = (item: any) => {
    let _this = this;
    var params = {
      Bucket: environment.BucketSite.concat('/', item.AttachedFile.PathFile),
      Key: item.AttachedFile.Name,
    };

    this.spinner.show();
    fileS3.DeleteS3(params, (err, data) => {
      _this.spinner.hide();
      if (err) return false;
      else {
        this.fileList = this.fileList.filter(
          (x) => x.IdAnswerActionFileChecklist != item.IdAnswerActionFileChecklist
        );
      }
    });
  };
}
