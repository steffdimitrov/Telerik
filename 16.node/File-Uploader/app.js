(function () {
  'use strict';

  let formidable = require('formidable'),
    http = require('http'),
    util = require('util'),
    fs = require('fs-extra'),
    url = require('url'),
    uuid = require('node-uuid'),
    jade = require('jade'),
    port = 12000;

  // create server
  http.createServer(function (req, res) {
    var queryData = url.parse(req.url, true);

    let dir = __dirname + '/uploads/';

    if (!fs.existsSync(dir)){
        fs.mkdirSync(dir);
    }

    if (req.url === '/') {

      let dir = __dirname + '/uploads/';


      let files = fs.readdirSync(dir);
      let filesList = [];

      for (let i in files) {
        var file = fs.readdirSync(__dirname + '/uploads/' + files[i]);
        var fileData = {name: file[0], id: files[i]};
		
        filesList.push(fileData);
      }

	  //console.log(filesList);
      let html = jade.compileFile('./views/index.jade');

      res.write(html({filesList}));
      res.end();

      return;
    }

    if(queryData.pathname ==='/download'){
      let dir = __dirname + '/uploads/' + queryData.query.id + '/';

         try {
             if (fs.statSync(dir)) {
                 var files = fs.readdirSync(dir),
                     file;

                 for (var i in files) {
                     file = files[i];
                     break;
                 }

                 res.writeHead(200, {
                     'Content-disposition': 'attachment; filename=' + file,
                     'content-type': 'text/html'
                 });
                 res.write(file, 'binary');
                 res.end();
             }
         } catch(e) {
             console.error('No such file exists');
         }
    }

    if (req.url === '/upload') {
      let html = jade.compileFile('./views/upload.jade');
      res.end(html());

      return;
    }

    if (req.url === '/404') {
      let html = jade.compileFile('./views/404.jade');
      res.writeHead(404,{});
      res.end(html());

      return;
    }

    if (req.url == '/upload-file' && req.method.toLowerCase() == 'post') {
      // parse a file upload
      var form = new formidable.IncomingForm();
      var fileId = uuid.v4();

      form.parse(req, function (err, fields, files) {
        if (!files.up.name) {
          res.writeHead(302, {
            'Location': 'http://localhost:12000/404'
          });

          res.end();
          return;
        }
        res.writeHead(302, {
          'content-type': 'text/plain',
          'Location': 'http://localhost:12000/'
        });
        res.write('received upload:\n\n');
        res.end();
      });

      form.on('end', function (fields, files) {
        if (this.openedFiles[0].name === '') {
          res.writeHead(404,{});
          return;
        }

        var temp_path = this.openedFiles[0].path;
        var file_name = this.openedFiles[0].name;
        var new_location = __dirname + '/uploads/' + fileId + '/';
        fs.copy(temp_path, new_location + file_name, function (err) {
          if (err) {
            console.error(err);
          } else {
            console.log("success!");
          }
        });
      });

      // Great way to keep a track on the progress of the upload for bigger files :)
      form.on('progress', function (bytesReceived, bytesExpected) {
        var percent_complete = (bytesReceived / bytesExpected) * 100;
        console.log(percent_complete.toFixed(2));
      });

      return;
    }

    res.end();
  }).listen(port);
  console.info(`Server listening on http://localhost:${port}`);
}());


//if(queryData.id) {
//    var dir = __dirname + '/uploads/' + queryData.id + '/';
//
//    try {
//        if (fs.statSync(dir)) {
//            var files = fs.readdirSync(dir),
//                file;
//
//            for (var i in files) {
//                file = files[i];
//                break;
//            }
//
//            res.writeHead(200, {
//                'Content-disposition': 'attachment; filename=' + file,
//                'content-type': 'text/html'
//            });
//            res.write(file, 'binary');
//            res.end();
//        }
//    } catch(e) {
//        console.error('No such file exists');
//    }
//}
//
//if (req.url == '/upload' && req.method.toLowerCase() == 'post') {
//
//    var form = new formidable.IncomingForm();
//    var guid = uuid.v1();
//
//    form.parse(req, function(err, fields, files) {
//        res.writeHead(200, {'content-type': 'text/html'});
//        res.write('<h4>Upload received!</h4>');
//        res.write('<div><h4 style="display: inline; margin-right: 5px">Project GUID:</h4>' +
//            '<h2 style="display: inline">' + guid + '</h2></div>');
//        res.end('<a href="/">Go back</a>');
//    });
//    form.on('end', function(fields, files) {
//        var temp_path = this.openedFiles[0].path;
//        var file_name = this.openedFiles[0].name;
//        var new_location = __dirname + '/uploads/' + guid + '/';
//        fs.copy(temp_path, new_location + file_name, function(err) {
//            if (err) {
//                console.error(err);
//            } else {
//                console.log("success!")
//            }
//        });
//    });
//    return;
//}
//
//res.writeHead(200, {'content-type': 'text/html'});
//res.end(
//    '<div><input type="text" id="id" placeholder="Enter file GUID" style="width: 350px">' +
//    '<button onclick="window.location = \'/?id=\' + document.getElementById(\'id\').value">Download</button></div>' +
//    '<span style="font-size: 10px">Disclaimer: If you enter invalid GUID, nothing will happen</span>' +
//    '<hr />'+
//    '<form action="/upload" method="post" enctype="multipart/form-data">'+
//    '<input type="file" name="upload" multiple="multiple"><br>'+
//    '<input type="submit" value="Upload">'+
//    '</form>'
//);
