"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var chalk_1 = __importDefault(require("chalk"));
var figlet_1 = __importDefault(require("figlet"));
var commander_1 = __importDefault(require("commander"));
var ProjectCreator_1 = __importDefault(require("./ProjectCreator"));
// clear();
console.log(chalk_1.default.red(figlet_1.default.textSync('Eclipse Dirigible', { horizontalLayout: 'full' })));
var Creator = new ProjectCreator_1.default();
commander_1.default
    .version('0.1.0');
commander_1.default
    .command('generate [url]')
    .description('Generates new mobile app')
    .action(Creator.createProject);
commander_1.default.parse(process.argv);
