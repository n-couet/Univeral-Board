/**
 * Created by nicolas.couet on 03/04/2015.
 */

exports.ABaseEntity = function () {
    exports.ABaseEntity.prototype.listen;
    exports.ABaseEntity.prototype.act;

    
    exports.ABaseEntity.prototype.listAction = function(port) {
        if (port == undefined)
            port = 'default';
        if (port in this.act)
            return this.act[port];
        return undefined;
    }

    exports.ABaseEntity.prototype.listAllAction = function(port) {
        if (port == undefined)
            port = 'default';
        if (port in this.act)
            return this.act[port];
        return undefined;
    }
};