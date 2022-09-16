import chalk from 'chalk';
import clear from 'clear';
import figlet from 'figlet';
import program from 'commander';
import ProjectCreator from './ProjectCreator';

// clear();
console.log(
    chalk.red(
        figlet.textSync('Eclipse Dirigible', { horizontalLayout: 'full' })
    )
);

const Creator = new ProjectCreator();

program
    .version('0.1.0')

program
    .command('generate [url]')
    .description('Generates new mobile app')
    .action(Creator.createProject);


program.parse(process.argv);