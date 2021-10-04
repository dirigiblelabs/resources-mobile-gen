export default class ProjectCreator {
    constructor();
    createProject(url: string): Promise<void>;
    static setUrl(oldUrl: string, newUrl: string): Promise<unknown>;
    static buildArchive(): Promise<unknown>;
}
