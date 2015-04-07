/**
 * Created by nicolas.couet on 03/04/2015.
 */

var ABaseEntity = function (name) {
    this.watch('name', ABaseEntity.prototype.changename);
    this.name = name;
};

ABaseEntity.prototype.move = function(meters) {
    console.log(this.name+" moved "+meters+"m.");
};

ABaseEntity.prototype.changename = function(id, oldval, newval) {
    console.log('name change ' + ' id ' + id + ' old ' + oldval + ' newval ' + newval);
};

module.exports = ABaseEntity;