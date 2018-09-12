import * as _ from "lodash";
import { Pipe, PipeTransform } from "@angular/core";

@Pipe({
    name: "dataFilter"
})
export class DataFilterPipe implements PipeTransform {

    // transform(array: any[], query: string): any {
    //     if (query) {
    //         return _.filter(array, row=>row.name.indexOf(query) > -1);
    //     }
    //     return array;
    // }
    transform(items: any[], args): any[] {
        if (typeof items === 'object') {
            var resultArray = [];
            if (args.length === 0) {
                resultArray = items;
            }
            else {
                args = args.replace(/[&\/\\#,+()$~%.'":*?<>{}]/g, '');
                var keys = Object.keys(items[0]);
                for (let item of items) {
                    _.each(keys, function (key, index) {
                        if (item[key] != null && item[key].toString().match(new RegExp('' + args, 'i'))) {
                            resultArray.push(item);
                        }
                    })
                }
            }
            var mySubArray = _.uniq(resultArray, 'name');
            return mySubArray;
        }
        else {
            return null;
        }

    }
}