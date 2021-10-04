import fs from 'fs';
import path from 'path';
let xcodebuild = require('./xcodebuild');

export default class ProjectCreator {

    constructor() {
        //option variables
    }

    public async createProject(url: string) {
        console.log(`Creating project ${url} from Project Creator`);
        await ProjectCreator.setUrl("APP_URL", url);
        await ProjectCreator.buildArchive();
        await ProjectCreator.setUrl(url, "APP_URL");
    }

    static setUrl(oldUrl: string, newUrl: string) {
        return new Promise((resolve, reject) => {
            let filePath = path.join(__dirname, '..', "DirigibleMobile/ContentView.swift");

            fs.readFile(filePath, 'utf8', function (err,data) {
                if (err) {
                    return console.log(err);
                }

                var re = new RegExp(oldUrl,"g");
                var result = data.replace(re, newUrl);
                
                fs.writeFile(filePath, result, 'utf8', function (err) {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(null);
                    }
                });
            });
        });
        
    }

    static buildArchive() {
        return new Promise((resolve, reject) => {
            xcodebuild('build', {
                path: path.join(__dirname, '..')
              }, function (error: any) {
                if (error) {
                    reject(error);
                } else {
                    resolve(null);
                }
              })
        })
        
    }
}